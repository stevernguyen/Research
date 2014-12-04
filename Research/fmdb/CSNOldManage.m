//
//  CSNOldManage.m
//  Research
//
//  Created by tvo on 12/4/14.
//  Copyright (c) 2014 tvo. All rights reserved.
//

#import "CSNOldManage.h"
#import "FMDatabase.h"
 
@implementation CSNOldManage

- (NSString*)databasePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *dbPath = [documentsDirectory stringByAppendingPathComponent:@"ChiaSeNhac.sqlite"];
    return dbPath;
}

- (BOOL)isExistDataBase
{
    return [[NSFileManager defaultManager] fileExistsAtPath:[self databasePath]];
}

- (NSArray *)fetchAllObjectOfEntity:(NSString *)entity
{
    if ([self isExistDataBase] == NO)
        return nil;
    
    FMDatabase * db = [FMDatabase databaseWithPath:[self databasePath]];
    if ([db open]) {
        NSMutableArray *result = [NSMutableArray new];
        
        NSString * sql = [NSString stringWithFormat:@"select * from %@",entity];
        FMResultSet * rs = [db executeQuery:sql];
        while ([rs next]) {
            [result addObject:[rs resultDictionary]];
        }
        [db close];
        
        return result;
    }
    
    return nil;
}

@end
