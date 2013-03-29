//
//  LTNotice.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/14/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//
// 消息中心 - 通知

typedef enum {
    MCKNoticeTextType,
    MCKNoticeMMSType,
    MCKNoticeVoteType,
    MCKNoticeUnknownType
}MCKNoticeType;

#import "MCKModelBaseIdentifier.h"
#import "MCKStudyPlan.h"

@interface MCKNotice : MCKModelBaseIdentifier

@property (nonatomic, strong) NSString *NameStr;
@property (nonatomic, strong) NSString *senderId;
@property (nonatomic, strong) NSString *senderName;
@property (nonatomic, strong) NSString *senderImg;
@property (nonatomic, strong) NSString *messageTime;
// 通知有三种类型，文字，投票和彩信
@property (nonatomic, assign) MCKNoticeType noticeType;

@property (nonatomic, strong) NSString *messageContent;
@property (nonatomic, strong) NSString *mmsImageUrl;
// 1已读0未读
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, assign) NSInteger mmsId;
@property (nonatomic, assign) NSInteger repostUserId;
@property (nonatomic, strong) NSString *repostUserName;
@property (nonatomic, strong) NSString *mmsImageIcon;
@property (nonatomic, strong) NSString *senderType;
@property (nonatomic, strong) MCKStudyPlan *studyPlan;

- (void)unpackDictionary:(NSDictionary *)dictionary;

@end
