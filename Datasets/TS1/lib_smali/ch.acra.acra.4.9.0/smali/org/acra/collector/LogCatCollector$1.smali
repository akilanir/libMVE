.class Lorg/acra/collector/LogCatCollector$1;
.super Ljava/lang/Object;
.source "LogCatCollector.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/acra/collector/LogCatCollector;->collectLogCat(Lorg/acra/config/ACRAConfiguration;Ljava/lang/String;)Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/acra/collector/LogCatCollector;

.field final synthetic val$process:Ljava/lang/Process;


# direct methods
.method constructor <init>(Lorg/acra/collector/LogCatCollector;Ljava/lang/Process;)V
    .registers 3
    .param p1, "this$0"    # Lorg/acra/collector/LogCatCollector;

    .prologue
    .line 105
    iput-object p1, p0, Lorg/acra/collector/LogCatCollector$1;->this$0:Lorg/acra/collector/LogCatCollector;

    iput-object p2, p0, Lorg/acra/collector/LogCatCollector$1;->val$process:Ljava/lang/Process;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 109
    :try_start_0
    iget-object v0, p0, Lorg/acra/collector/LogCatCollector$1;->val$process:Ljava/lang/Process;

    invoke-virtual {v0}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0}, Lorg/acra/util/IOUtils;->streamToString(Ljava/io/InputStream;)Ljava/lang/String;
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_9} :catch_a

    .line 112
    :goto_9
    return-void

    .line 110
    :catch_a
    move-exception v0

    goto :goto_9
.end method
