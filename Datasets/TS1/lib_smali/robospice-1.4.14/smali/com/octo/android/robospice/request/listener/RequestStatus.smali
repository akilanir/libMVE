.class public final enum Lcom/octo/android/robospice/request/listener/RequestStatus;
.super Ljava/lang/Enum;
.source "RequestStatus.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/octo/android/robospice/request/listener/RequestStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/octo/android/robospice/request/listener/RequestStatus;

.field public static final enum COMPLETE:Lcom/octo/android/robospice/request/listener/RequestStatus;

.field public static final enum LOADING_FROM_NETWORK:Lcom/octo/android/robospice/request/listener/RequestStatus;

.field public static final enum PENDING:Lcom/octo/android/robospice/request/listener/RequestStatus;

.field public static final enum READING_FROM_CACHE:Lcom/octo/android/robospice/request/listener/RequestStatus;

.field public static final enum WRITING_TO_CACHE:Lcom/octo/android/robospice/request/listener/RequestStatus;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 4
    new-instance v0, Lcom/octo/android/robospice/request/listener/RequestStatus;

    const-string v1, "PENDING"

    invoke-direct {v0, v1, v2}, Lcom/octo/android/robospice/request/listener/RequestStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/octo/android/robospice/request/listener/RequestStatus;->PENDING:Lcom/octo/android/robospice/request/listener/RequestStatus;

    .line 5
    new-instance v0, Lcom/octo/android/robospice/request/listener/RequestStatus;

    const-string v1, "READING_FROM_CACHE"

    invoke-direct {v0, v1, v3}, Lcom/octo/android/robospice/request/listener/RequestStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/octo/android/robospice/request/listener/RequestStatus;->READING_FROM_CACHE:Lcom/octo/android/robospice/request/listener/RequestStatus;

    .line 6
    new-instance v0, Lcom/octo/android/robospice/request/listener/RequestStatus;

    const-string v1, "LOADING_FROM_NETWORK"

    invoke-direct {v0, v1, v4}, Lcom/octo/android/robospice/request/listener/RequestStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/octo/android/robospice/request/listener/RequestStatus;->LOADING_FROM_NETWORK:Lcom/octo/android/robospice/request/listener/RequestStatus;

    .line 7
    new-instance v0, Lcom/octo/android/robospice/request/listener/RequestStatus;

    const-string v1, "WRITING_TO_CACHE"

    invoke-direct {v0, v1, v5}, Lcom/octo/android/robospice/request/listener/RequestStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/octo/android/robospice/request/listener/RequestStatus;->WRITING_TO_CACHE:Lcom/octo/android/robospice/request/listener/RequestStatus;

    .line 8
    new-instance v0, Lcom/octo/android/robospice/request/listener/RequestStatus;

    const-string v1, "COMPLETE"

    invoke-direct {v0, v1, v6}, Lcom/octo/android/robospice/request/listener/RequestStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/octo/android/robospice/request/listener/RequestStatus;->COMPLETE:Lcom/octo/android/robospice/request/listener/RequestStatus;

    .line 3
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/octo/android/robospice/request/listener/RequestStatus;

    sget-object v1, Lcom/octo/android/robospice/request/listener/RequestStatus;->PENDING:Lcom/octo/android/robospice/request/listener/RequestStatus;

    aput-object v1, v0, v2

    sget-object v1, Lcom/octo/android/robospice/request/listener/RequestStatus;->READING_FROM_CACHE:Lcom/octo/android/robospice/request/listener/RequestStatus;

    aput-object v1, v0, v3

    sget-object v1, Lcom/octo/android/robospice/request/listener/RequestStatus;->LOADING_FROM_NETWORK:Lcom/octo/android/robospice/request/listener/RequestStatus;

    aput-object v1, v0, v4

    sget-object v1, Lcom/octo/android/robospice/request/listener/RequestStatus;->WRITING_TO_CACHE:Lcom/octo/android/robospice/request/listener/RequestStatus;

    aput-object v1, v0, v5

    sget-object v1, Lcom/octo/android/robospice/request/listener/RequestStatus;->COMPLETE:Lcom/octo/android/robospice/request/listener/RequestStatus;

    aput-object v1, v0, v6

    sput-object v0, Lcom/octo/android/robospice/request/listener/RequestStatus;->$VALUES:[Lcom/octo/android/robospice/request/listener/RequestStatus;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 3
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/octo/android/robospice/request/listener/RequestStatus;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 3
    const-class v0, Lcom/octo/android/robospice/request/listener/RequestStatus;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/octo/android/robospice/request/listener/RequestStatus;

    return-object v0
.end method

.method public static values()[Lcom/octo/android/robospice/request/listener/RequestStatus;
    .registers 1

    .prologue
    .line 3
    sget-object v0, Lcom/octo/android/robospice/request/listener/RequestStatus;->$VALUES:[Lcom/octo/android/robospice/request/listener/RequestStatus;

    invoke-virtual {v0}, [Lcom/octo/android/robospice/request/listener/RequestStatus;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/octo/android/robospice/request/listener/RequestStatus;

    return-object v0
.end method
