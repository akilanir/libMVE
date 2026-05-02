.class public final Lorg/acra/builder/ReportBuilder;
.super Ljava/lang/Object;
.source "ReportBuilder.java"


# instance fields
.field private final customData:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private endApplication:Z

.field private exception:Ljava/lang/Throwable;

.field private message:Ljava/lang/String;

.field private sendSilently:Z

.field private uncaughtExceptionThread:Ljava/lang/Thread;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/acra/builder/ReportBuilder;->customData:Ljava/util/Map;

    .line 21
    iput-boolean v1, p0, Lorg/acra/builder/ReportBuilder;->sendSilently:Z

    .line 22
    iput-boolean v1, p0, Lorg/acra/builder/ReportBuilder;->endApplication:Z

    return-void
.end method


# virtual methods
.method public build(Lorg/acra/builder/ReportExecutor;)V
    .registers 3
    .param p1, "reportExecutor"    # Lorg/acra/builder/ReportExecutor;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 146
    iget-object v0, p0, Lorg/acra/builder/ReportBuilder;->message:Ljava/lang/String;

    if-nez v0, :cond_c

    iget-object v0, p0, Lorg/acra/builder/ReportBuilder;->exception:Ljava/lang/Throwable;

    if-nez v0, :cond_c

    .line 147
    const-string v0, "Report requested by developer"

    iput-object v0, p0, Lorg/acra/builder/ReportBuilder;->message:Ljava/lang/String;

    .line 150
    :cond_c
    invoke-virtual {p1, p0}, Lorg/acra/builder/ReportExecutor;->execute(Lorg/acra/builder/ReportBuilder;)V

    .line 151
    return-void
.end method

.method public customData(Ljava/lang/String;Ljava/lang/String;)Lorg/acra/builder/ReportBuilder;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "value"    # Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 101
    iget-object v0, p0, Lorg/acra/builder/ReportBuilder;->customData:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    return-object p0
.end method

.method public customData(Ljava/util/Map;)Lorg/acra/builder/ReportBuilder;
    .registers 3
    .param p1    # Ljava/util/Map;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lorg/acra/builder/ReportBuilder;"
        }
    .end annotation

    .prologue
    .line 86
    .local p1, "customData":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v0, p0, Lorg/acra/builder/ReportBuilder;->customData:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 87
    return-object p0
.end method

.method public endApplication()Lorg/acra/builder/ReportBuilder;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 132
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/acra/builder/ReportBuilder;->endApplication:Z

    .line 133
    return-object p0
.end method

.method public exception(Ljava/lang/Throwable;)Lorg/acra/builder/ReportBuilder;
    .registers 2
    .param p1, "e"    # Ljava/lang/Throwable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 67
    iput-object p1, p0, Lorg/acra/builder/ReportBuilder;->exception:Ljava/lang/Throwable;

    .line 68
    return-object p0
.end method

.method public getCustomData()Ljava/util/Map;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 107
    iget-object v0, p0, Lorg/acra/builder/ReportBuilder;->customData:Ljava/util/Map;

    return-object v0
.end method

.method public getException()Ljava/lang/Throwable;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 73
    iget-object v0, p0, Lorg/acra/builder/ReportBuilder;->exception:Ljava/lang/Throwable;

    return-object v0
.end method

.method public getMessage()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 39
    iget-object v0, p0, Lorg/acra/builder/ReportBuilder;->message:Ljava/lang/String;

    return-object v0
.end method

.method public getUncaughtExceptionThread()Ljava/lang/Thread;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 56
    iget-object v0, p0, Lorg/acra/builder/ReportBuilder;->uncaughtExceptionThread:Ljava/lang/Thread;

    return-object v0
.end method

.method public isEndApplication()Z
    .registers 2

    .prologue
    .line 137
    iget-boolean v0, p0, Lorg/acra/builder/ReportBuilder;->endApplication:Z

    return v0
.end method

.method public isSendSilently()Z
    .registers 2

    .prologue
    .line 122
    iget-boolean v0, p0, Lorg/acra/builder/ReportBuilder;->sendSilently:Z

    return v0
.end method

.method public message(Ljava/lang/String;)Lorg/acra/builder/ReportBuilder;
    .registers 2
    .param p1, "msg"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 33
    iput-object p1, p0, Lorg/acra/builder/ReportBuilder;->message:Ljava/lang/String;

    .line 34
    return-object p0
.end method

.method public sendSilently()Lorg/acra/builder/ReportBuilder;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 117
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/acra/builder/ReportBuilder;->sendSilently:Z

    .line 118
    return-object p0
.end method

.method public uncaughtExceptionThread(Ljava/lang/Thread;)Lorg/acra/builder/ReportBuilder;
    .registers 2
    .param p1, "thread"    # Ljava/lang/Thread;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 50
    iput-object p1, p0, Lorg/acra/builder/ReportBuilder;->uncaughtExceptionThread:Ljava/lang/Thread;

    .line 51
    return-object p0
.end method
