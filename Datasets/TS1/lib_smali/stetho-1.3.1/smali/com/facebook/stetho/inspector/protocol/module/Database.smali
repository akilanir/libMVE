.class public Lcom/facebook/stetho/inspector/protocol/module/Database;
.super Ljava/lang/Object;
.source "Database.java"

# interfaces
.implements Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xb
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver;,
        Lcom/facebook/stetho/inspector/protocol/module/Database$Error;,
        Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseObject;,
        Lcom/facebook/stetho/inspector/protocol/module/Database$AddDatabaseEvent;,
        Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLResponse;,
        Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLRequest;,
        Lcom/facebook/stetho/inspector/protocol/module/Database$GetDatabaseTableNamesResponse;,
        Lcom/facebook/stetho/inspector/protocol/module/Database$GetDatabaseTableNamesRequest;,
        Lcom/facebook/stetho/inspector/protocol/module/Database$DatabasePeerRegistrationListener;
    }
.end annotation


# static fields
.field private static final MAX_BLOB_LENGTH:I = 0x200

.field private static final MAX_EXECUTE_RESULTS:I = 0xfa

.field private static final UNKNOWN_BLOB_LABEL:Ljava/lang/String; = "{blob}"


# instance fields
.field private final mChromePeerManager:Lcom/facebook/stetho/inspector/helper/ChromePeerManager;

.field private mDatabaseDrivers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver;",
            ">;"
        }
    .end annotation
.end field

.field private final mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

.field private final mPeerListener:Lcom/facebook/stetho/inspector/protocol/module/Database$DatabasePeerRegistrationListener;


# direct methods
.method public constructor <init>()V
    .registers 4

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/Database;->mDatabaseDrivers:Ljava/util/List;

    .line 77
    new-instance v0, Lcom/facebook/stetho/inspector/helper/ChromePeerManager;

    invoke-direct {v0}, Lcom/facebook/stetho/inspector/helper/ChromePeerManager;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/Database;->mChromePeerManager:Lcom/facebook/stetho/inspector/helper/ChromePeerManager;

    .line 78
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Database$DatabasePeerRegistrationListener;

    iget-object v1, p0, Lcom/facebook/stetho/inspector/protocol/module/Database;->mDatabaseDrivers:Ljava/util/List;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Database$DatabasePeerRegistrationListener;-><init>(Ljava/util/List;Lcom/facebook/stetho/inspector/protocol/module/Database$1;)V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/Database;->mPeerListener:Lcom/facebook/stetho/inspector/protocol/module/Database$DatabasePeerRegistrationListener;

    .line 79
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/Database;->mChromePeerManager:Lcom/facebook/stetho/inspector/helper/ChromePeerManager;

    iget-object v1, p0, Lcom/facebook/stetho/inspector/protocol/module/Database;->mPeerListener:Lcom/facebook/stetho/inspector/protocol/module/Database$DatabasePeerRegistrationListener;

    invoke-virtual {v0, v1}, Lcom/facebook/stetho/inspector/helper/ChromePeerManager;->setListener(Lcom/facebook/stetho/inspector/helper/PeerRegistrationListener;)V

    .line 80
    new-instance v0, Lcom/facebook/stetho/json/ObjectMapper;

    invoke-direct {v0}, Lcom/facebook/stetho/json/ObjectMapper;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/Database;->mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

    .line 81
    return-void
.end method

.method static synthetic access$200(Landroid/database/Cursor;I)Ljava/util/ArrayList;
    .registers 3
    .param p0, "x0"    # Landroid/database/Cursor;
    .param p1, "x1"    # I

    .prologue
    .line 45
    invoke-static {p0, p1}, Lcom/facebook/stetho/inspector/protocol/module/Database;->flattenRows(Landroid/database/Cursor;I)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method private static blobToString([B)Ljava/lang/String;
    .registers 3
    .param p0, "blob"    # [B

    .prologue
    .line 229
    array-length v0, p0

    const/16 v1, 0x200

    if-gt v0, v1, :cond_14

    .line 230
    invoke-static {p0}, Lcom/facebook/stetho/inspector/protocol/module/Database;->fastIsAscii([B)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 232
    :try_start_b
    new-instance v0, Ljava/lang/String;

    const-string v1, "US-ASCII"

    invoke-direct {v0, p0, v1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_12
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_b .. :try_end_12} :catch_13

    .line 238
    :goto_12
    return-object v0

    .line 233
    :catch_13
    move-exception v0

    .line 238
    :cond_14
    const-string v0, "{blob}"

    goto :goto_12
.end method

.method private static fastIsAscii([B)Z
    .registers 6
    .param p0, "blob"    # [B

    .prologue
    const/4 v1, 0x0

    .line 242
    array-length v3, p0

    move v2, v1

    :goto_3
    if-ge v2, v3, :cond_f

    aget-byte v0, p0, v2

    .line 243
    .local v0, "b":B
    and-int/lit8 v4, v0, -0x80

    if-eqz v4, :cond_c

    .line 247
    .end local v0    # "b":B
    :goto_b
    return v1

    .line 242
    .restart local v0    # "b":B
    :cond_c
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 247
    .end local v0    # "b":B
    :cond_f
    const/4 v1, 0x1

    goto :goto_b
.end method

.method private static flattenRows(Landroid/database/Cursor;I)Ljava/util/ArrayList;
    .registers 8
    .param p0, "cursor"    # Landroid/database/Cursor;
    .param p1, "limit"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            "I)",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 195
    if-ltz p1, :cond_2c

    const/4 v4, 0x1

    :goto_3
    invoke-static {v4}, Lcom/facebook/stetho/common/Util;->throwIfNot(Z)V

    .line 196
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 197
    .local v1, "flatList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-interface {p0}, Landroid/database/Cursor;->getColumnCount()I

    move-result v2

    .line 198
    .local v2, "numColumns":I
    const/4 v3, 0x0

    .local v3, "row":I
    :goto_10
    if-ge v3, p1, :cond_5a

    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_5a

    .line 199
    const/4 v0, 0x0

    .local v0, "column":I
    :goto_19
    if-ge v0, v2, :cond_57

    .line 200
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getType(I)I

    move-result v4

    packed-switch v4, :pswitch_data_6c

    .line 215
    :pswitch_22
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 199
    :goto_29
    add-int/lit8 v0, v0, 0x1

    goto :goto_19

    .line 195
    .end local v0    # "column":I
    .end local v1    # "flatList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v2    # "numColumns":I
    .end local v3    # "row":I
    :cond_2c
    const/4 v4, 0x0

    goto :goto_3

    .line 202
    .restart local v0    # "column":I
    .restart local v1    # "flatList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v2    # "numColumns":I
    .restart local v3    # "row":I
    :pswitch_2e
    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_29

    .line 205
    :pswitch_33
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_29

    .line 208
    :pswitch_3f
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_29

    .line 211
    :pswitch_4b
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v4

    invoke-static {v4}, Lcom/facebook/stetho/inspector/protocol/module/Database;->blobToString([B)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_29

    .line 198
    :cond_57
    add-int/lit8 v3, v3, 0x1

    goto :goto_10

    .line 220
    .end local v0    # "column":I
    :cond_5a
    invoke-interface {p0}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v4

    if-nez v4, :cond_6b

    .line 221
    const/4 v0, 0x0

    .restart local v0    # "column":I
    :goto_61
    if-ge v0, v2, :cond_6b

    .line 222
    const-string v4, "{truncated}"

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 221
    add-int/lit8 v0, v0, 0x1

    goto :goto_61

    .line 225
    .end local v0    # "column":I
    :cond_6b
    return-object v1

    .line 200
    :pswitch_data_6c
    .packed-switch 0x0
        :pswitch_2e
        :pswitch_33
        :pswitch_3f
        :pswitch_22
        :pswitch_4b
    .end packed-switch
.end method

.method private getDatabasePeer(Ljava/lang/String;)Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver;
    .registers 6
    .param p1, "databaseId"    # Ljava/lang/String;

    .prologue
    .line 177
    iget-object v2, p0, Lcom/facebook/stetho/inspector/protocol/module/Database;->mDatabaseDrivers:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_6
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver;

    .line 178
    .local v0, "databaseDriver":Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver;
    invoke-virtual {v0}, Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver;->getDatabaseNames()Ljava/util/List;

    move-result-object v1

    .line 179
    .local v1, "databaseNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v1, :cond_6

    invoke-interface {v1, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 182
    .end local v0    # "databaseDriver":Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver;
    .end local v1    # "databaseNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_1e
    return-object v0

    :cond_1f
    const/4 v0, 0x0

    goto :goto_1e
.end method


# virtual methods
.method public add(Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver;)V
    .registers 3
    .param p1, "databaseDriver"    # Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver;

    .prologue
    .line 84
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/Database;->mDatabaseDrivers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    return-void
.end method

.method public disable(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lorg/json/JSONObject;)V
    .registers 4
    .param p1, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation runtime Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsMethod;
    .end annotation

    .prologue
    .line 94
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/Database;->mChromePeerManager:Lcom/facebook/stetho/inspector/helper/ChromePeerManager;

    invoke-virtual {v0, p1}, Lcom/facebook/stetho/inspector/helper/ChromePeerManager;->removePeer(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;)V

    .line 95
    return-void
.end method

.method public enable(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lorg/json/JSONObject;)V
    .registers 4
    .param p1, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation runtime Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsMethod;
    .end annotation

    .prologue
    .line 89
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/Database;->mChromePeerManager:Lcom/facebook/stetho/inspector/helper/ChromePeerManager;

    invoke-virtual {v0, p1}, Lcom/facebook/stetho/inspector/helper/ChromePeerManager;->addPeer(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;)Z

    .line 90
    return-void
.end method

.method public executeSQL(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lorg/json/JSONObject;)Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcResult;
    .registers 13
    .param p1, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation runtime Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsMethod;
    .end annotation

    .prologue
    .line 121
    iget-object v7, p0, Lcom/facebook/stetho/inspector/protocol/module/Database;->mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

    const-class v8, Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLRequest;

    invoke-virtual {v7, p2, v8}, Lcom/facebook/stetho/json/ObjectMapper;->convertValue(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLRequest;

    .line 124
    .local v5, "request":Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLRequest;
    iget-object v1, v5, Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLRequest;->databaseId:Ljava/lang/String;

    .line 125
    .local v1, "databaseId":Ljava/lang/String;
    iget-object v4, v5, Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLRequest;->query:Ljava/lang/String;

    .line 127
    .local v4, "query":Ljava/lang/String;
    invoke-direct {p0, v1}, Lcom/facebook/stetho/inspector/protocol/module/Database;->getDatabasePeer(Ljava/lang/String;)Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver;

    move-result-object v0

    .line 130
    .local v0, "databaseDriver":Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver;
    :try_start_12
    iget-object v7, v5, Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLRequest;->databaseId:Ljava/lang/String;

    iget-object v8, v5, Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLRequest;->query:Ljava/lang/String;

    new-instance v9, Lcom/facebook/stetho/inspector/protocol/module/Database$1;

    invoke-direct {v9, p0}, Lcom/facebook/stetho/inspector/protocol/module/Database$1;-><init>(Lcom/facebook/stetho/inspector/protocol/module/Database;)V

    invoke-virtual {v0, v7, v8, v9}, Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver;->executeSQL(Ljava/lang/String;Ljava/lang/String;Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver$ExecuteResultHandler;)Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLResponse;
    :try_end_1e
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_12 .. :try_end_1e} :catch_20

    move-result-object v6

    .line 172
    :goto_1f
    return-object v6

    .line 166
    :catch_20
    move-exception v2

    .line 167
    .local v2, "e":Landroid/database/sqlite/SQLiteException;
    new-instance v3, Lcom/facebook/stetho/inspector/protocol/module/Database$Error;

    invoke-direct {v3}, Lcom/facebook/stetho/inspector/protocol/module/Database$Error;-><init>()V

    .line 168
    .local v3, "error":Lcom/facebook/stetho/inspector/protocol/module/Database$Error;
    const/4 v7, 0x0

    iput v7, v3, Lcom/facebook/stetho/inspector/protocol/module/Database$Error;->code:I

    .line 169
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v7

    iput-object v7, v3, Lcom/facebook/stetho/inspector/protocol/module/Database$Error;->message:Ljava/lang/String;

    .line 170
    new-instance v6, Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLResponse;

    invoke-direct {v6}, Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLResponse;-><init>()V

    .line 171
    .local v6, "response":Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLResponse;
    iput-object v3, v6, Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLResponse;->sqlError:Lcom/facebook/stetho/inspector/protocol/module/Database$Error;

    goto :goto_1f
.end method

.method public getDatabaseTableNames(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lorg/json/JSONObject;)Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcResult;
    .registers 13
    .param p1, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation runtime Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsMethod;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 100
    iget-object v5, p0, Lcom/facebook/stetho/inspector/protocol/module/Database;->mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

    const-class v6, Lcom/facebook/stetho/inspector/protocol/module/Database$GetDatabaseTableNamesRequest;

    invoke-virtual {v5, p2, v6}, Lcom/facebook/stetho/json/ObjectMapper;->convertValue(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/facebook/stetho/inspector/protocol/module/Database$GetDatabaseTableNamesRequest;

    .line 103
    .local v3, "request":Lcom/facebook/stetho/inspector/protocol/module/Database$GetDatabaseTableNamesRequest;
    iget-object v1, v3, Lcom/facebook/stetho/inspector/protocol/module/Database$GetDatabaseTableNamesRequest;->databaseId:Ljava/lang/String;

    .line 104
    .local v1, "databaseId":Ljava/lang/String;
    invoke-direct {p0, v1}, Lcom/facebook/stetho/inspector/protocol/module/Database;->getDatabasePeer(Ljava/lang/String;)Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver;

    move-result-object v0

    .line 107
    .local v0, "databaseDriver":Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver;
    :try_start_11
    new-instance v4, Lcom/facebook/stetho/inspector/protocol/module/Database$GetDatabaseTableNamesResponse;

    const/4 v5, 0x0

    invoke-direct {v4, v5}, Lcom/facebook/stetho/inspector/protocol/module/Database$GetDatabaseTableNamesResponse;-><init>(Lcom/facebook/stetho/inspector/protocol/module/Database$1;)V

    .line 108
    .local v4, "response":Lcom/facebook/stetho/inspector/protocol/module/Database$GetDatabaseTableNamesResponse;
    iget-object v5, v3, Lcom/facebook/stetho/inspector/protocol/module/Database$GetDatabaseTableNamesRequest;->databaseId:Ljava/lang/String;

    invoke-virtual {v0, v5}, Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver;->getTableNames(Ljava/lang/String;)Ljava/util/List;

    move-result-object v5

    iput-object v5, v4, Lcom/facebook/stetho/inspector/protocol/module/Database$GetDatabaseTableNamesResponse;->tableNames:Ljava/util/List;
    :try_end_1f
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_11 .. :try_end_1f} :catch_20

    .line 109
    return-object v4

    .line 110
    .end local v4    # "response":Lcom/facebook/stetho/inspector/protocol/module/Database$GetDatabaseTableNamesResponse;
    :catch_20
    move-exception v2

    .line 111
    .local v2, "e":Landroid/database/sqlite/SQLiteException;
    new-instance v5, Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcException;

    new-instance v6, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError;

    sget-object v7, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError$ErrorCode;->INVALID_REQUEST:Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError$ErrorCode;

    .line 114
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteException;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v7, v8, v9}, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError;-><init>(Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError$ErrorCode;Ljava/lang/String;Lorg/json/JSONObject;)V

    invoke-direct {v5, v6}, Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcException;-><init>(Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError;)V

    throw v5
.end method
