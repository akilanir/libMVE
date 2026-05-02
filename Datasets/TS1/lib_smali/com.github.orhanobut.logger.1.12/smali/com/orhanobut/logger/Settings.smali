.class public final Lcom/orhanobut/logger/Settings;
.super Ljava/lang/Object;
.source "Settings.java"


# instance fields
.field private logLevel:Lcom/orhanobut/logger/LogLevel;

.field private logTool:Lcom/orhanobut/logger/LogTool;

.field private methodCount:I

.field private methodOffset:I

.field private showThreadInfo:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    const/4 v0, 0x2

    iput v0, p0, Lcom/orhanobut/logger/Settings;->methodCount:I

    .line 6
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/orhanobut/logger/Settings;->showThreadInfo:Z

    .line 7
    const/4 v0, 0x0

    iput v0, p0, Lcom/orhanobut/logger/Settings;->methodOffset:I

    .line 13
    sget-object v0, Lcom/orhanobut/logger/LogLevel;->FULL:Lcom/orhanobut/logger/LogLevel;

    iput-object v0, p0, Lcom/orhanobut/logger/Settings;->logLevel:Lcom/orhanobut/logger/LogLevel;

    return-void
.end method


# virtual methods
.method public getLogLevel()Lcom/orhanobut/logger/LogLevel;
    .registers 2

    .prologue
    .line 74
    iget-object v0, p0, Lcom/orhanobut/logger/Settings;->logLevel:Lcom/orhanobut/logger/LogLevel;

    return-object v0
.end method

.method public getLogTool()Lcom/orhanobut/logger/LogTool;
    .registers 2

    .prologue
    .line 82
    iget-object v0, p0, Lcom/orhanobut/logger/Settings;->logTool:Lcom/orhanobut/logger/LogTool;

    if-nez v0, :cond_b

    .line 83
    new-instance v0, Lcom/orhanobut/logger/AndroidLogTool;

    invoke-direct {v0}, Lcom/orhanobut/logger/AndroidLogTool;-><init>()V

    iput-object v0, p0, Lcom/orhanobut/logger/Settings;->logTool:Lcom/orhanobut/logger/LogTool;

    .line 85
    :cond_b
    iget-object v0, p0, Lcom/orhanobut/logger/Settings;->logTool:Lcom/orhanobut/logger/LogTool;

    return-object v0
.end method

.method public getMethodCount()I
    .registers 2

    .prologue
    .line 66
    iget v0, p0, Lcom/orhanobut/logger/Settings;->methodCount:I

    return v0
.end method

.method public getMethodOffset()I
    .registers 2

    .prologue
    .line 78
    iget v0, p0, Lcom/orhanobut/logger/Settings;->methodOffset:I

    return v0
.end method

.method public hideThreadInfo()Lcom/orhanobut/logger/Settings;
    .registers 2

    .prologue
    .line 16
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/orhanobut/logger/Settings;->showThreadInfo:Z

    .line 17
    return-object p0
.end method

.method public isShowThreadInfo()Z
    .registers 2

    .prologue
    .line 70
    iget-boolean v0, p0, Lcom/orhanobut/logger/Settings;->showThreadInfo:Z

    return v0
.end method

.method public logLevel(Lcom/orhanobut/logger/LogLevel;)Lcom/orhanobut/logger/Settings;
    .registers 2
    .param p1, "logLevel"    # Lcom/orhanobut/logger/LogLevel;

    .prologue
    .line 44
    iput-object p1, p0, Lcom/orhanobut/logger/Settings;->logLevel:Lcom/orhanobut/logger/LogLevel;

    .line 45
    return-object p0
.end method

.method public logTool(Lcom/orhanobut/logger/LogTool;)Lcom/orhanobut/logger/Settings;
    .registers 2
    .param p1, "logTool"    # Lcom/orhanobut/logger/LogTool;

    .prologue
    .line 61
    iput-object p1, p0, Lcom/orhanobut/logger/Settings;->logTool:Lcom/orhanobut/logger/LogTool;

    .line 62
    return-object p0
.end method

.method public methodCount(I)Lcom/orhanobut/logger/Settings;
    .registers 2
    .param p1, "methodCount"    # I

    .prologue
    .line 28
    if-gez p1, :cond_3

    .line 29
    const/4 p1, 0x0

    .line 31
    :cond_3
    iput p1, p0, Lcom/orhanobut/logger/Settings;->methodCount:I

    .line 32
    return-object p0
.end method

.method public methodOffset(I)Lcom/orhanobut/logger/Settings;
    .registers 2
    .param p1, "offset"    # I

    .prologue
    .line 56
    iput p1, p0, Lcom/orhanobut/logger/Settings;->methodOffset:I

    .line 57
    return-object p0
.end method

.method public setLogLevel(Lcom/orhanobut/logger/LogLevel;)Lcom/orhanobut/logger/Settings;
    .registers 3
    .param p1, "logLevel"    # Lcom/orhanobut/logger/LogLevel;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 40
    invoke-virtual {p0, p1}, Lcom/orhanobut/logger/Settings;->logLevel(Lcom/orhanobut/logger/LogLevel;)Lcom/orhanobut/logger/Settings;

    move-result-object v0

    return-object v0
.end method

.method public setMethodCount(I)Lcom/orhanobut/logger/Settings;
    .registers 3
    .param p1, "methodCount"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 24
    invoke-virtual {p0, p1}, Lcom/orhanobut/logger/Settings;->methodCount(I)Lcom/orhanobut/logger/Settings;

    move-result-object v0

    return-object v0
.end method

.method public setMethodOffset(I)Lcom/orhanobut/logger/Settings;
    .registers 3
    .param p1, "offset"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 52
    invoke-virtual {p0, p1}, Lcom/orhanobut/logger/Settings;->methodOffset(I)Lcom/orhanobut/logger/Settings;

    move-result-object v0

    return-object v0
.end method
