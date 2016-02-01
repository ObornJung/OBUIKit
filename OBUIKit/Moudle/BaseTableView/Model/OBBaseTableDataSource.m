//
//  OBBaseTableDataSource.m
//  OBUIKit
//
//  Created by Oborn.Jung on 15/11/18.
//  Copyright © 2015年 Oborn.Jung. All rights reserved.
//

#import "OBBaseTableDataSource.h"
#import "OBTableCellFactory.h"
#import "OBBaseComponentTag.h"
#import "OBDebugMacro.h"
#import "NSArray+OBExtend.h"

@interface OBBaseTableDataSource ()

@property (nonatomic, strong, nullable) NSMutableArray<NSMutableArray<OBBaseComponentModel *> *> * dataSource;
@property (nonatomic, strong, nonnull) OBTableCellFactory     * cellFactory;

- (BOOL)_isKindOfDataSource:(OBTableDataSourceType *)dataSource;
- (BOOL)_isKindOfSectionData:(OBTableSectionDataType *)sectionData;

@end

@implementation OBBaseTableDataSource

- (instancetype)init {
    return [self initWithTableView:nil];
}

- (nonnull instancetype)initWithTableView:(nullable UITableView *)aHostTableView {
    self = [super init];
    if (self) {
        _autoRefresh   = YES;
        _hostTableView = aHostTableView;
        _cellFactory = [[OBTableCellFactory alloc] init];
    }
    return self;
}

#pragma -

- (void)setCellInterceptor:(id<OBTableCellMappingProtocol>)cellInterceptor {
    _cellFactory.interceptor = cellInterceptor;
}

- (id<OBTableCellMappingProtocol>)cellInterceptor {
    return _cellFactory.interceptor;
}

- (void)setDataSource:(OBTableDataSourceType *)dataSource {
    if ([self _isKindOfDataSource:dataSource]) {
        _dataSource = [dataSource ob_mutableDeepCopy];
        [self _reloadHostView];
    }
}

- (void)appendDataSource:(OBTableDataSourceType * _Nullable)dataSource {
    if ([self _isKindOfDataSource:dataSource]) {
        [_dataSource addObjectsFromArray:[dataSource ob_mutableDeepCopy]];
        [self _reloadHostView];
    }
}

- (void)insertSection:(OBTableSectionDataType * _Nonnull)sectionData
            atSection:(NSInteger)section {
    if ([self _isKindOfSectionData:sectionData]) {
        section = section < self.dataSource.count ?: self.dataSource.count;
        [_dataSource insertObject:[sectionData ob_mutableDeepCopy] atIndex:section];
        [self _reloadSection:section withAnimated:YES];
    }
}

- (void)insertComponentModel:(OBBaseComponentModel * _Nonnull)model
                 atIndexPath:(NSIndexPath * _Nonnull)indexPath {
    NSInteger section = indexPath.section;
    if (section < _dataSource.count) {
        NSMutableArray<OBBaseComponentModel *> * orderComponents = _dataSource[section];
        NSInteger insetIndexOfRow = indexPath.row < orderComponents.count ?: orderComponents.count;
        [orderComponents insertObject:model atIndex:insetIndexOfRow];
        [self _reloadSection:indexPath.section withAnimated:YES];
    }
}

- (void)deleteComponentModelAtIndexPath:(NSIndexPath * _Nonnull)indexPath {
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    if (section < _dataSource.count && row < _dataSource[section].count) {
        NSMutableArray<OBBaseComponentModel *> * sectionComponents = _dataSource[section];
        [sectionComponents removeObjectAtIndex:row];
        [self _reloadSection:section withAnimated:YES];
    }
}

- (CGFloat)tableView:(nullable UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    OBBaseComponentModel * model = [self modelWithIndexPath:indexPath];
    if (model && OBComponentStatusHidden != model.modelStatus) {
        Class<OBTableCellProtocol> cellClass = [_cellFactory cellClassForModel:model];
        if (cellClass) {
            return [cellClass tableView:nil rowHeightForModel:model];
        }
    }
    return 0;
}

- (nullable __kindof OBBaseComponentModel *)modelWithIndexPath:(nonnull NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    if (section < _dataSource.count) {
        NSInteger row = indexPath.row;
        NSArray<OBBaseComponentModel *> * orderComponents = _dataSource[section];
        if (row < orderComponents.count) {
            return orderComponents[row];
        }
    }
    return nil;
}

- (OBBaseComponentModel *)firstObject {
    return self.dataSource.firstObject.firstObject;
}

- (OBBaseComponentModel *)lastObject {
    return self.dataSource.lastObject.lastObject;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section < _dataSource.count) {
        return _dataSource[section].count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    OBBaseComponentModel * model = [self modelWithIndexPath:indexPath];
    UITableViewCell<OBTableCellProtocol> * cell = nil;
    Class cellClass = [self.cellFactory cellClassForModel:model];
    OBAssert(cellClass, @"");
    
    NSString * reuseIdentifier = NSStringFromClass(cellClass) ?: kOBTableDefaultCellKey;
    cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [_cellFactory cellForModel:model
                          reuseIdentifier:reuseIdentifier];
        if (!cell) {
            cell = [[OBTableBaseCell alloc] initWithReuseIdentifier:kOBTableDefaultCellKey];
        }
    }
    
    if ([cell respondsToSelector:@selector(setModel:)]) {
        [cell setModel:model];
    }
    return cell;
}

- (CGFloat)tableView:(nullable UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

-(CGFloat)tableView:(nullable UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

#pragma mark - Private methods

- (BOOL)_isKindOfDataSource:(OBTableDataSourceType *)dataSource {
    if (dataSource && ![dataSource isKindOfClass:[NSArray class]]) {
        OBAssert(NO, @"");
        return NO;
    }
    
    for (OBTableSectionDataType * componentsModel in dataSource) {
        return [self _isKindOfSectionData:componentsModel];
    }
    return YES;
}

- (BOOL)_isKindOfSectionData:(OBTableSectionDataType *)sectionData {
    if (sectionData && ![sectionData isKindOfClass:[NSArray class]]) {
        OBAssert(NO, @"");
        return NO;
    }
    for (OBBaseComponentModel * component in sectionData) {
        if (![component isKindOfClass:[OBBaseComponentModel class]]) {
            OBAssert(NO, @"");
            return NO;
        }
    }
    return YES;
}

- (void)_reloadHostView {
    if (_hostTableView && self.isAutoRefresh) {
        dispatch_main_async_safe(^{
            [_hostTableView reloadData];
        });
    }
}

- (void)_reloadSection:(NSUInteger)section withAnimated:(BOOL)animated {
    if (_hostTableView && self.isAutoRefresh && section < _dataSource.count) {
        dispatch_main_async_safe(^{
            UITableViewRowAnimation animationType = UITableViewRowAnimationNone;
            if (animated) {
                animationType = UITableViewRowAnimationFade;
            }
            [_hostTableView reloadSections:[NSIndexSet indexSetWithIndex:section]
                          withRowAnimation:animationType];
        });
    }
}

- (void)_reloadRowAtIndexPath:(NSIndexPath *)indexPath withAnimated:(BOOL)animated {

    if (indexPath && _hostTableView && self.isAutoRefresh &&
        indexPath.section < _dataSource.count && indexPath.row < _dataSource[indexPath.section].count) {
        dispatch_main_async_safe(^{
            UITableViewRowAnimation animationType = UITableViewRowAnimationNone;
            if (animated) {
                animationType = UITableViewRowAnimationFade;
            }
            [_hostTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:animationType];
        });
    }
}

@end
