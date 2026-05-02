.class public Lcom/facebook/stetho/inspector/helper/IntegerFormatter;
.super Ljava/lang/Object;
.source "IntegerFormatter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/stetho/inspector/helper/IntegerFormatter$IntegerFormatterWithHex;
    }
.end annotation


# static fields
.field private static cachedFormatter:Lcom/facebook/stetho/inspector/helper/IntegerFormatter;


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    return-void
.end method

.method synthetic constructor <init>(Lcom/facebook/stetho/inspector/helper/IntegerFormatter$1;)V
    .registers 2
    .param p1, "x0"    # Lcom/facebook/stetho/inspector/helper/IntegerFormatter$1;

    .prologue
    .line 17
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/helper/IntegerFormatter;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/facebook/stetho/inspector/helper/IntegerFormatter;
    .registers 3

    .prologue
    .line 21
    sget-object v0, Lcom/facebook/stetho/inspector/helper/IntegerFormatter;->cachedFormatter:Lcom/facebook/stetho/inspector/helper/IntegerFormatter;

    if-nez v0, :cond_1a

    .line 22
    const-class v1, Lcom/facebook/stetho/inspector/helper/IntegerFormatter;

    monitor-enter v1

    .line 23
    :try_start_7
    sget-object v0, Lcom/facebook/stetho/inspector/helper/IntegerFormatter;->cachedFormatter:Lcom/facebook/stetho/inspector/helper/IntegerFormatter;

    if-nez v0, :cond_19

    .line 24
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v0, v2, :cond_1d

    .line 25
    new-instance v0, Lcom/facebook/stetho/inspector/helper/IntegerFormatter$IntegerFormatterWithHex;

    const/4 v2, 0x0

    invoke-direct {v0, v2}, Lcom/facebook/stetho/inspector/helper/IntegerFormatter$IntegerFormatterWithHex;-><init>(Lcom/facebook/stetho/inspector/helper/IntegerFormatter$1;)V

    sput-object v0, Lcom/facebook/stetho/inspector/helper/IntegerFormatter;->cachedFormatter:Lcom/facebook/stetho/inspector/helper/IntegerFormatter;

    .line 30
    :cond_19
    :goto_19
    monitor-exit v1
    :try_end_1a
    .catchall {:try_start_7 .. :try_end_1a} :catchall_25

    .line 33
    :cond_1a
    sget-object v0, Lcom/facebook/stetho/inspector/helper/IntegerFormatter;->cachedFormatter:Lcom/facebook/stetho/inspector/helper/IntegerFormatter;

    return-object v0

    .line 27
    :cond_1d
    :try_start_1d
    new-instance v0, Lcom/facebook/stetho/inspector/helper/IntegerFormatter;

    invoke-direct {v0}, Lcom/facebook/stetho/inspector/helper/IntegerFormatter;-><init>()V

    sput-object v0, Lcom/facebook/stetho/inspector/helper/IntegerFormatter;->cachedFormatter:Lcom/facebook/stetho/inspector/helper/IntegerFormatter;

    goto :goto_19

    .line 30
    :catchall_25
    move-exception v0

    monitor-exit v1
    :try_end_27
    .catchall {:try_start_1d .. :try_end_27} :catchall_25

    throw v0
.end method


# virtual methods
.method public format(Ljava/lang/Integer;Landroid/view/ViewDebug$ExportedProperty;)Ljava/lang/String;
    .registers 4
    .param p1, "integer"    # Ljava/lang/Integer;
    .param p2, "annotation"    # Landroid/view/ViewDebug$ExportedProperty;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 40
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
