//
//  OBBaseTableDataSource.h
//  OBUIKit
//
//  Created by Oborn.Jung on 15/11/18.
//  Copyright © 2015年 Oborn.Jung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OBBaseComponentModel.h"
#import "OBTableCellMappingProtocol.h"

typedef NSArray<OBBaseComponentModel  *>    OBTableSectionDataType;
typedef NSArray<OBTableSectionDataType *>   OBTableDataSourceType;

#pragma mark - OBTableDataSourceProtocol

@protocol OBTableDataSourceProtocol <UITableViewDataSource>

@required

/**
 *  获取indexPath对应的cell高度
 *
 *  @param tableView tableView
 *  @param indexPath indexPath
 *
 *  @return indexPath对应的cell高度
 */
- (CGFloat)tableView:(nullable UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath;
/**
 *  获取section对应的header高度
 *
 *  @param tableView tableView
 *  @param section   section
 *
 *  @return section对应的header高度
 */
- (CGFloat)tableView:(nullable UITableView *)tableView heightForHeaderInSection:(NSInteger)section;

/**
 *  获取section对应的footer高度
 *
 *  @param tableView tableView
 *  @param section   section
 *
 *  @return section对应的footer高度
 */
-(CGFloat)tableView:(nullable UITableView *)tableView heightForFooterInSection:(NSInteger)section;
/**
 *  获取dataSource
 *
 *  @param dataSource dataSource
 */
- (void)setDataSource:(OBTableDataSourceType * _Nullable)dataSource;
/**
 *  在dataSource后面添加数据
 *
 *  @param dataSource dataSource
 */
- (void)appendDataSource:(OBTableDataSourceType * _Nullable)dataSource;
/**
 *  插入特定的section
 *
 *  @param sectionData section data
 *  @param section     需要插入的section
 */
- (void)insertSection:(OBTableSectionDataType * _Nonnull)sectionData
            atSection:(NSInteger)section;
/**
 *  插入一个componentModel
 *
 *  @param model     component model
 *  @param indexPath 要插入的indexPath
 */
- (void)insertComponentModel:(OBBaseComponentModel * _Nonnull)model
                 atIndexPath:(NSIndexPath * _Nonnull)indexPath;

/**
 *  删除一个componentModel
 *
 *  @param indexPath 要插入的componetModel的indexPath
 */
- (void)deleteComponentModelAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
/**
 *  获取indexPath对应的model
 *
 *  @param indexPath indexPath
 *
 *  @return indexPath对应的model
 */
- (nullable __kindof OBBaseComponentModel *)modelWithIndexPath:(nonnull NSIndexPath *)indexPath;

@end

#pragma mark - OBBaseTableDataSource

@interface OBBaseTableDataSource : NSObject <OBTableDataSourceProtocol>

/**
 *  当dataSource改变时，是否自动刷新host tableView(默认YES)
 */
@property (nonatomic, assign, getter=isAutoRefresh) BOOL        autoRefresh;
/**
 *  host table view
 */
@property (nullable, nonatomic, weak  ) UITableView             * hostTableView;
/**
 *  cell扩展协议
 */
@property (nonatomic, weak) id<OBTableCellMappingProtocol>      cellInterceptor;

@property (nullable, nonatomic, readonly) OBBaseComponentModel  * firstObject;
@property (nullable, nonatomic, readonly) OBBaseComponentModel  * lastObject;

/**
 *  初始化data source
 *
 *  @param aHostTableView 对应的host table view
 *
 *  @return data source
 */
- (nonnull instancetype)initWithTableView:(nullable UITableView *)aHostTableView;

@end


