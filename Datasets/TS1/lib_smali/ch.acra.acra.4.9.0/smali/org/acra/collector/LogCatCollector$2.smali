.class Lorg/acra/collector/LogCatCollector$2;
.super Ljava/lang/Object;
.source "LogCatCollector.java"

# interfaces
.implements Lcom/android/internal/util/Predicate;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/acra/collector/LogCatCollector;->collectLogCat(Lorg/acra/config/ACRAConfiguration;Ljava/lang/String;)Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/internal/util/Predicate",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/acra/collector/LogCatCollector;

.field final synthetic val$finalMyPidStr:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/acra/collector/LogCatCollector;Ljava/lang/String;)V
    .registers 3
    .param p1, "this$0"    # Lorg/acra/collector/LogCatCollector;

    .prologue
    .line 116
    iput-object p1, p0, Lorg/acra/collector/LogCatCollector$2;->this$0:Lorg/acra/collector/LogCatCollector;

    iput-object p2, p0, Lorg/acra/collector/LogCatCollector$2;->val$finalMyPidStr:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic apply(Ljava/lang/Object;)Z
    .registers 3

    .prologue
    .line 116
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lorg/acra/collector/LogCatCollector$2;->apply(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public apply(Ljava/lang/String;)Z
    .registers 3
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 119
    iget-object v0, p0, Lorg/acra/collector/LogCatCollector$2;->val$finalMyPidStr:Ljava/lang/String;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lorg/acra/collector/LogCatCollector$2;->val$finalMyPidStr:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method
