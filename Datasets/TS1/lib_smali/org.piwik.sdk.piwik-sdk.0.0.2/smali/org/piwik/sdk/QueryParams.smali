.class public final enum Lorg/piwik/sdk/QueryParams;
.super Ljava/lang/Enum;
.source "QueryParams.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/piwik/sdk/QueryParams;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/piwik/sdk/QueryParams;

.field public static final enum ACTION_NAME:Lorg/piwik/sdk/QueryParams;

.field public static final enum API_VERSION:Lorg/piwik/sdk/QueryParams;

.field public static final enum AUTHENTICATION_TOKEN:Lorg/piwik/sdk/QueryParams;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final enum CAMPAIGN_KEYWORD:Lorg/piwik/sdk/QueryParams;

.field public static final enum CAMPAIGN_NAME:Lorg/piwik/sdk/QueryParams;

.field public static final enum CONTENT_INTERACTION:Lorg/piwik/sdk/QueryParams;

.field public static final enum CONTENT_NAME:Lorg/piwik/sdk/QueryParams;

.field public static final enum CONTENT_PIECE:Lorg/piwik/sdk/QueryParams;

.field public static final enum CONTENT_TARGET:Lorg/piwik/sdk/QueryParams;

.field public static final enum COUNTRY:Lorg/piwik/sdk/QueryParams;

.field public static final enum DATETIME_OF_REQUEST:Lorg/piwik/sdk/QueryParams;

.field public static final enum DOWNLOAD:Lorg/piwik/sdk/QueryParams;

.field public static final enum EVENT_ACTION:Lorg/piwik/sdk/QueryParams;

.field public static final enum EVENT_CATEGORY:Lorg/piwik/sdk/QueryParams;

.field public static final enum EVENT_NAME:Lorg/piwik/sdk/QueryParams;

.field public static final enum EVENT_VALUE:Lorg/piwik/sdk/QueryParams;

.field public static final enum FIRST_VISIT_TIMESTAMP:Lorg/piwik/sdk/QueryParams;

.field public static final enum GOAL_ID:Lorg/piwik/sdk/QueryParams;

.field public static final enum HOURS:Lorg/piwik/sdk/QueryParams;

.field public static final enum LANGUAGE:Lorg/piwik/sdk/QueryParams;

.field public static final enum LATITUDE:Lorg/piwik/sdk/QueryParams;

.field public static final enum LINK:Lorg/piwik/sdk/QueryParams;

.field public static final enum LONGITUDE:Lorg/piwik/sdk/QueryParams;

.field public static final enum MINUTES:Lorg/piwik/sdk/QueryParams;

.field public static final enum PREVIOUS_VISIT_TIMESTAMP:Lorg/piwik/sdk/QueryParams;

.field public static final enum RANDOM_NUMBER:Lorg/piwik/sdk/QueryParams;

.field public static final enum RECORD:Lorg/piwik/sdk/QueryParams;

.field public static final enum REFERRER:Lorg/piwik/sdk/QueryParams;

.field public static final enum REVENUE:Lorg/piwik/sdk/QueryParams;

.field public static final enum SCREEN_RESOLUTION:Lorg/piwik/sdk/QueryParams;

.field public static final enum SCREEN_SCOPE_CUSTOM_VARIABLES:Lorg/piwik/sdk/QueryParams;

.field public static final enum SEARCH_CATEGORY:Lorg/piwik/sdk/QueryParams;

.field public static final enum SEARCH_KEYWORD:Lorg/piwik/sdk/QueryParams;

.field public static final enum SEARCH_NUMBER_OF_HITS:Lorg/piwik/sdk/QueryParams;

.field public static final enum SECONDS:Lorg/piwik/sdk/QueryParams;

.field public static final enum SEND_IMAGE:Lorg/piwik/sdk/QueryParams;

.field public static final enum SESSION_START:Lorg/piwik/sdk/QueryParams;

.field public static final enum SITE_ID:Lorg/piwik/sdk/QueryParams;

.field public static final enum TOTAL_NUMBER_OF_VISITS:Lorg/piwik/sdk/QueryParams;

.field public static final enum URL_PATH:Lorg/piwik/sdk/QueryParams;

.field public static final enum USER_AGENT:Lorg/piwik/sdk/QueryParams;

.field public static final enum USER_ID:Lorg/piwik/sdk/QueryParams;

.field public static final enum VISITOR_ID:Lorg/piwik/sdk/QueryParams;

.field public static final enum VISIT_SCOPE_CUSTOM_VARIABLES:Lorg/piwik/sdk/QueryParams;


# instance fields
.field private final value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 21
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "SITE_ID"

    const-string v2, "idsite"

    invoke-direct {v0, v1, v4, v2}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->SITE_ID:Lorg/piwik/sdk/QueryParams;

    .line 27
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "RECORD"

    const-string v2, "rec"

    invoke-direct {v0, v1, v5, v2}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->RECORD:Lorg/piwik/sdk/QueryParams;

    .line 33
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "URL_PATH"

    const-string v2, "url"

    invoke-direct {v0, v1, v6, v2}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->URL_PATH:Lorg/piwik/sdk/QueryParams;

    .line 44
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "ACTION_NAME"

    const-string v2, "action_name"

    invoke-direct {v0, v1, v7, v2}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->ACTION_NAME:Lorg/piwik/sdk/QueryParams;

    .line 52
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "VISITOR_ID"

    const-string v2, "_id"

    invoke-direct {v0, v1, v8, v2}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->VISITOR_ID:Lorg/piwik/sdk/QueryParams;

    .line 59
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "RANDOM_NUMBER"

    const/4 v2, 0x5

    const-string v3, "rand"

    invoke-direct {v0, v1, v2, v3}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->RANDOM_NUMBER:Lorg/piwik/sdk/QueryParams;

    .line 65
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "API_VERSION"

    const/4 v2, 0x6

    const-string v3, "apiv"

    invoke-direct {v0, v1, v2, v3}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->API_VERSION:Lorg/piwik/sdk/QueryParams;

    .line 73
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "REFERRER"

    const/4 v2, 0x7

    const-string v3, "urlref"

    invoke-direct {v0, v1, v2, v3}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->REFERRER:Lorg/piwik/sdk/QueryParams;

    .line 78
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "VISIT_SCOPE_CUSTOM_VARIABLES"

    const/16 v2, 0x8

    const-string v3, "_cvar"

    invoke-direct {v0, v1, v2, v3}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->VISIT_SCOPE_CUSTOM_VARIABLES:Lorg/piwik/sdk/QueryParams;

    .line 85
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "TOTAL_NUMBER_OF_VISITS"

    const/16 v2, 0x9

    const-string v3, "_idvc"

    invoke-direct {v0, v1, v2, v3}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->TOTAL_NUMBER_OF_VISITS:Lorg/piwik/sdk/QueryParams;

    .line 90
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "PREVIOUS_VISIT_TIMESTAMP"

    const/16 v2, 0xa

    const-string v3, "_viewts"

    invoke-direct {v0, v1, v2, v3}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->PREVIOUS_VISIT_TIMESTAMP:Lorg/piwik/sdk/QueryParams;

    .line 96
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "FIRST_VISIT_TIMESTAMP"

    const/16 v2, 0xb

    const-string v3, "_idts"

    invoke-direct {v0, v1, v2, v3}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->FIRST_VISIT_TIMESTAMP:Lorg/piwik/sdk/QueryParams;

    .line 102
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "CAMPAIGN_NAME"

    const/16 v2, 0xc

    const-string v3, "_rcn"

    invoke-direct {v0, v1, v2, v3}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->CAMPAIGN_NAME:Lorg/piwik/sdk/QueryParams;

    .line 108
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "CAMPAIGN_KEYWORD"

    const/16 v2, 0xd

    const-string v3, "_rck"

    invoke-direct {v0, v1, v2, v3}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->CAMPAIGN_KEYWORD:Lorg/piwik/sdk/QueryParams;

    .line 112
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "SCREEN_RESOLUTION"

    const/16 v2, 0xe

    const-string v3, "res"

    invoke-direct {v0, v1, v2, v3}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->SCREEN_RESOLUTION:Lorg/piwik/sdk/QueryParams;

    .line 116
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "HOURS"

    const/16 v2, 0xf

    const-string v3, "h"

    invoke-direct {v0, v1, v2, v3}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->HOURS:Lorg/piwik/sdk/QueryParams;

    .line 120
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "MINUTES"

    const/16 v2, 0x10

    const-string v3, "m"

    invoke-direct {v0, v1, v2, v3}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->MINUTES:Lorg/piwik/sdk/QueryParams;

    .line 124
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "SECONDS"

    const/16 v2, 0x11

    const-string v3, "s"

    invoke-direct {v0, v1, v2, v3}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->SECONDS:Lorg/piwik/sdk/QueryParams;

    .line 129
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "USER_AGENT"

    const/16 v2, 0x12

    const-string v3, "ua"

    invoke-direct {v0, v1, v2, v3}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->USER_AGENT:Lorg/piwik/sdk/QueryParams;

    .line 134
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "LANGUAGE"

    const/16 v2, 0x13

    const-string v3, "lang"

    invoke-direct {v0, v1, v2, v3}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->LANGUAGE:Lorg/piwik/sdk/QueryParams;

    .line 143
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "USER_ID"

    const/16 v2, 0x14

    const-string v3, "uid"

    invoke-direct {v0, v1, v2, v3}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->USER_ID:Lorg/piwik/sdk/QueryParams;

    .line 147
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "SESSION_START"

    const/16 v2, 0x15

    const-string v3, "new_visit"

    invoke-direct {v0, v1, v2, v3}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->SESSION_START:Lorg/piwik/sdk/QueryParams;

    .line 155
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "SCREEN_SCOPE_CUSTOM_VARIABLES"

    const/16 v2, 0x16

    const-string v3, "cvar"

    invoke-direct {v0, v1, v2, v3}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->SCREEN_SCOPE_CUSTOM_VARIABLES:Lorg/piwik/sdk/QueryParams;

    .line 160
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "LINK"

    const/16 v2, 0x17

    const-string v3, "link"

    invoke-direct {v0, v1, v2, v3}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->LINK:Lorg/piwik/sdk/QueryParams;

    .line 165
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "DOWNLOAD"

    const/16 v2, 0x18

    const-string v3, "download"

    invoke-direct {v0, v1, v2, v3}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->DOWNLOAD:Lorg/piwik/sdk/QueryParams;

    .line 170
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "SEARCH_KEYWORD"

    const/16 v2, 0x19

    const-string v3, "search"

    invoke-direct {v0, v1, v2, v3}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->SEARCH_KEYWORD:Lorg/piwik/sdk/QueryParams;

    .line 174
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "SEARCH_CATEGORY"

    const/16 v2, 0x1a

    const-string v3, "search_cat"

    invoke-direct {v0, v1, v2, v3}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->SEARCH_CATEGORY:Lorg/piwik/sdk/QueryParams;

    .line 178
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "SEARCH_NUMBER_OF_HITS"

    const/16 v2, 0x1b

    const-string v3, "search_count"

    invoke-direct {v0, v1, v2, v3}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->SEARCH_NUMBER_OF_HITS:Lorg/piwik/sdk/QueryParams;

    .line 182
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "GOAL_ID"

    const/16 v2, 0x1c

    const-string v3, "idgoal"

    invoke-direct {v0, v1, v2, v3}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->GOAL_ID:Lorg/piwik/sdk/QueryParams;

    .line 187
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "REVENUE"

    const/16 v2, 0x1d

    const-string v3, "revenue"

    invoke-direct {v0, v1, v2, v3}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->REVENUE:Lorg/piwik/sdk/QueryParams;

    .line 195
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "AUTHENTICATION_TOKEN"

    const/16 v2, 0x1e

    const-string v3, "token_auth"

    invoke-direct {v0, v1, v2, v3}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->AUTHENTICATION_TOKEN:Lorg/piwik/sdk/QueryParams;

    .line 202
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "COUNTRY"

    const/16 v2, 0x1f

    const-string v3, "country"

    invoke-direct {v0, v1, v2, v3}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->COUNTRY:Lorg/piwik/sdk/QueryParams;

    .line 207
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "LATITUDE"

    const/16 v2, 0x20

    const-string v3, "lat"

    invoke-direct {v0, v1, v2, v3}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->LATITUDE:Lorg/piwik/sdk/QueryParams;

    .line 212
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "LONGITUDE"

    const/16 v2, 0x21

    const-string v3, "long"

    invoke-direct {v0, v1, v2, v3}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->LONGITUDE:Lorg/piwik/sdk/QueryParams;

    .line 222
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "DATETIME_OF_REQUEST"

    const/16 v2, 0x22

    const-string v3, "cdt"

    invoke-direct {v0, v1, v2, v3}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->DATETIME_OF_REQUEST:Lorg/piwik/sdk/QueryParams;

    .line 230
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "CONTENT_NAME"

    const/16 v2, 0x23

    const-string v3, "c_n"

    invoke-direct {v0, v1, v2, v3}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->CONTENT_NAME:Lorg/piwik/sdk/QueryParams;

    .line 236
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "CONTENT_PIECE"

    const/16 v2, 0x24

    const-string v3, "c_p"

    invoke-direct {v0, v1, v2, v3}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->CONTENT_PIECE:Lorg/piwik/sdk/QueryParams;

    .line 242
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "CONTENT_TARGET"

    const/16 v2, 0x25

    const-string v3, "c_t"

    invoke-direct {v0, v1, v2, v3}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->CONTENT_TARGET:Lorg/piwik/sdk/QueryParams;

    .line 248
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "CONTENT_INTERACTION"

    const/16 v2, 0x26

    const-string v3, "c_i"

    invoke-direct {v0, v1, v2, v3}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->CONTENT_INTERACTION:Lorg/piwik/sdk/QueryParams;

    .line 255
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "EVENT_CATEGORY"

    const/16 v2, 0x27

    const-string v3, "e_c"

    invoke-direct {v0, v1, v2, v3}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->EVENT_CATEGORY:Lorg/piwik/sdk/QueryParams;

    .line 261
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "EVENT_ACTION"

    const/16 v2, 0x28

    const-string v3, "e_a"

    invoke-direct {v0, v1, v2, v3}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->EVENT_ACTION:Lorg/piwik/sdk/QueryParams;

    .line 267
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "EVENT_NAME"

    const/16 v2, 0x29

    const-string v3, "e_n"

    invoke-direct {v0, v1, v2, v3}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->EVENT_NAME:Lorg/piwik/sdk/QueryParams;

    .line 273
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "EVENT_VALUE"

    const/16 v2, 0x2a

    const-string v3, "e_v"

    invoke-direct {v0, v1, v2, v3}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->EVENT_VALUE:Lorg/piwik/sdk/QueryParams;

    .line 281
    new-instance v0, Lorg/piwik/sdk/QueryParams;

    const-string v1, "SEND_IMAGE"

    const/16 v2, 0x2b

    const-string v3, "send_image"

    invoke-direct {v0, v1, v2, v3}, Lorg/piwik/sdk/QueryParams;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/piwik/sdk/QueryParams;->SEND_IMAGE:Lorg/piwik/sdk/QueryParams;

    .line 14
    const/16 v0, 0x2c

    new-array v0, v0, [Lorg/piwik/sdk/QueryParams;

    sget-object v1, Lorg/piwik/sdk/QueryParams;->SITE_ID:Lorg/piwik/sdk/QueryParams;

    aput-object v1, v0, v4

    sget-object v1, Lorg/piwik/sdk/QueryParams;->RECORD:Lorg/piwik/sdk/QueryParams;

    aput-object v1, v0, v5

    sget-object v1, Lorg/piwik/sdk/QueryParams;->URL_PATH:Lorg/piwik/sdk/QueryParams;

    aput-object v1, v0, v6

    sget-object v1, Lorg/piwik/sdk/QueryParams;->ACTION_NAME:Lorg/piwik/sdk/QueryParams;

    aput-object v1, v0, v7

    sget-object v1, Lorg/piwik/sdk/QueryParams;->VISITOR_ID:Lorg/piwik/sdk/QueryParams;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lorg/piwik/sdk/QueryParams;->RANDOM_NUMBER:Lorg/piwik/sdk/QueryParams;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lorg/piwik/sdk/QueryParams;->API_VERSION:Lorg/piwik/sdk/QueryParams;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lorg/piwik/sdk/QueryParams;->REFERRER:Lorg/piwik/sdk/QueryParams;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lorg/piwik/sdk/QueryParams;->VISIT_SCOPE_CUSTOM_VARIABLES:Lorg/piwik/sdk/QueryParams;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lorg/piwik/sdk/QueryParams;->TOTAL_NUMBER_OF_VISITS:Lorg/piwik/sdk/QueryParams;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lorg/piwik/sdk/QueryParams;->PREVIOUS_VISIT_TIMESTAMP:Lorg/piwik/sdk/QueryParams;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lorg/piwik/sdk/QueryParams;->FIRST_VISIT_TIMESTAMP:Lorg/piwik/sdk/QueryParams;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lorg/piwik/sdk/QueryParams;->CAMPAIGN_NAME:Lorg/piwik/sdk/QueryParams;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lorg/piwik/sdk/QueryParams;->CAMPAIGN_KEYWORD:Lorg/piwik/sdk/QueryParams;

    aput-object v2, v0, v1

    const/16 v1, 0xe

    sget-object v2, Lorg/piwik/sdk/QueryParams;->SCREEN_RESOLUTION:Lorg/piwik/sdk/QueryParams;

    aput-object v2, v0, v1

    const/16 v1, 0xf

    sget-object v2, Lorg/piwik/sdk/QueryParams;->HOURS:Lorg/piwik/sdk/QueryParams;

    aput-object v2, v0, v1

    const/16 v1, 0x10

    sget-object v2, Lorg/piwik/sdk/QueryParams;->MINUTES:Lorg/piwik/sdk/QueryParams;

    aput-object v2, v0, v1

    const/16 v1, 0x11

    sget-object v2, Lorg/piwik/sdk/QueryParams;->SECONDS:Lorg/piwik/sdk/QueryParams;

    aput-object v2, v0, v1

    const/16 v1, 0x12

    sget-object v2, Lorg/piwik/sdk/QueryParams;->USER_AGENT:Lorg/piwik/sdk/QueryParams;

    aput-object v2, v0, v1

    const/16 v1, 0x13

    sget-object v2, Lorg/piwik/sdk/QueryParams;->LANGUAGE:Lorg/piwik/sdk/QueryParams;

    aput-object v2, v0, v1

    const/16 v1, 0x14

    sget-object v2, Lorg/piwik/sdk/QueryParams;->USER_ID:Lorg/piwik/sdk/QueryParams;

    aput-object v2, v0, v1

    const/16 v1, 0x15

    sget-object v2, Lorg/piwik/sdk/QueryParams;->SESSION_START:Lorg/piwik/sdk/QueryParams;

    aput-object v2, v0, v1

    const/16 v1, 0x16

    sget-object v2, Lorg/piwik/sdk/QueryParams;->SCREEN_SCOPE_CUSTOM_VARIABLES:Lorg/piwik/sdk/QueryParams;

    aput-object v2, v0, v1

    const/16 v1, 0x17

    sget-object v2, Lorg/piwik/sdk/QueryParams;->LINK:Lorg/piwik/sdk/QueryParams;

    aput-object v2, v0, v1

    const/16 v1, 0x18

    sget-object v2, Lorg/piwik/sdk/QueryParams;->DOWNLOAD:Lorg/piwik/sdk/QueryParams;

    aput-object v2, v0, v1

    const/16 v1, 0x19

    sget-object v2, Lorg/piwik/sdk/QueryParams;->SEARCH_KEYWORD:Lorg/piwik/sdk/QueryParams;

    aput-object v2, v0, v1

    const/16 v1, 0x1a

    sget-object v2, Lorg/piwik/sdk/QueryParams;->SEARCH_CATEGORY:Lorg/piwik/sdk/QueryParams;

    aput-object v2, v0, v1

    const/16 v1, 0x1b

    sget-object v2, Lorg/piwik/sdk/QueryParams;->SEARCH_NUMBER_OF_HITS:Lorg/piwik/sdk/QueryParams;

    aput-object v2, v0, v1

    const/16 v1, 0x1c

    sget-object v2, Lorg/piwik/sdk/QueryParams;->GOAL_ID:Lorg/piwik/sdk/QueryParams;

    aput-object v2, v0, v1

    const/16 v1, 0x1d

    sget-object v2, Lorg/piwik/sdk/QueryParams;->REVENUE:Lorg/piwik/sdk/QueryParams;

    aput-object v2, v0, v1

    const/16 v1, 0x1e

    sget-object v2, Lorg/piwik/sdk/QueryParams;->AUTHENTICATION_TOKEN:Lorg/piwik/sdk/QueryParams;

    aput-object v2, v0, v1

    const/16 v1, 0x1f

    sget-object v2, Lorg/piwik/sdk/QueryParams;->COUNTRY:Lorg/piwik/sdk/QueryParams;

    aput-object v2, v0, v1

    const/16 v1, 0x20

    sget-object v2, Lorg/piwik/sdk/QueryParams;->LATITUDE:Lorg/piwik/sdk/QueryParams;

    aput-object v2, v0, v1

    const/16 v1, 0x21

    sget-object v2, Lorg/piwik/sdk/QueryParams;->LONGITUDE:Lorg/piwik/sdk/QueryParams;

    aput-object v2, v0, v1

    const/16 v1, 0x22

    sget-object v2, Lorg/piwik/sdk/QueryParams;->DATETIME_OF_REQUEST:Lorg/piwik/sdk/QueryParams;

    aput-object v2, v0, v1

    const/16 v1, 0x23

    sget-object v2, Lorg/piwik/sdk/QueryParams;->CONTENT_NAME:Lorg/piwik/sdk/QueryParams;

    aput-object v2, v0, v1

    const/16 v1, 0x24

    sget-object v2, Lorg/piwik/sdk/QueryParams;->CONTENT_PIECE:Lorg/piwik/sdk/QueryParams;

    aput-object v2, v0, v1

    const/16 v1, 0x25

    sget-object v2, Lorg/piwik/sdk/QueryParams;->CONTENT_TARGET:Lorg/piwik/sdk/QueryParams;

    aput-object v2, v0, v1

    const/16 v1, 0x26

    sget-object v2, Lorg/piwik/sdk/QueryParams;->CONTENT_INTERACTION:Lorg/piwik/sdk/QueryParams;

    aput-object v2, v0, v1

    const/16 v1, 0x27

    sget-object v2, Lorg/piwik/sdk/QueryParams;->EVENT_CATEGORY:Lorg/piwik/sdk/QueryParams;

    aput-object v2, v0, v1

    const/16 v1, 0x28

    sget-object v2, Lorg/piwik/sdk/QueryParams;->EVENT_ACTION:Lorg/piwik/sdk/QueryParams;

    aput-object v2, v0, v1

    const/16 v1, 0x29

    sget-object v2, Lorg/piwik/sdk/QueryParams;->EVENT_NAME:Lorg/piwik/sdk/QueryParams;

    aput-object v2, v0, v1

    const/16 v1, 0x2a

    sget-object v2, Lorg/piwik/sdk/QueryParams;->EVENT_VALUE:Lorg/piwik/sdk/QueryParams;

    aput-object v2, v0, v1

    const/16 v1, 0x2b

    sget-object v2, Lorg/piwik/sdk/QueryParams;->SEND_IMAGE:Lorg/piwik/sdk/QueryParams;

    aput-object v2, v0, v1

    sput-object v0, Lorg/piwik/sdk/QueryParams;->$VALUES:[Lorg/piwik/sdk/QueryParams;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4
    .param p3, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 285
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 286
    iput-object p3, p0, Lorg/piwik/sdk/QueryParams;->value:Ljava/lang/String;

    .line 287
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/piwik/sdk/QueryParams;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 14
    const-class v0, Lorg/piwik/sdk/QueryParams;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/piwik/sdk/QueryParams;

    return-object v0
.end method

.method public static values()[Lorg/piwik/sdk/QueryParams;
    .registers 1

    .prologue
    .line 14
    sget-object v0, Lorg/piwik/sdk/QueryParams;->$VALUES:[Lorg/piwik/sdk/QueryParams;

    invoke-virtual {v0}, [Lorg/piwik/sdk/QueryParams;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/piwik/sdk/QueryParams;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 290
    iget-object v0, p0, Lorg/piwik/sdk/QueryParams;->value:Ljava/lang/String;

    return-object v0
.end method
