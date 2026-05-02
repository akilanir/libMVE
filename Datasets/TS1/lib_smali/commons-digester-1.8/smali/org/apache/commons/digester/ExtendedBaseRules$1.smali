.class Lorg/apache/commons/digester/ExtendedBaseRules$1;
.super Ljava/lang/Object;
.source "ExtendedBaseRules.java"

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field private final this$0:Lorg/apache/commons/digester/ExtendedBaseRules;


# direct methods
.method constructor <init>(Lorg/apache/commons/digester/ExtendedBaseRules;)V
    .registers 2
    .param p1, "this$0"    # Lorg/apache/commons/digester/ExtendedBaseRules;

    .prologue
    .line 424
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/apache/commons/digester/ExtendedBaseRules$1;->this$0:Lorg/apache/commons/digester/ExtendedBaseRules;

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 7
    .param p1, "o1"    # Ljava/lang/Object;
    .param p2, "o2"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassCastException;
        }
    .end annotation

    .prologue
    .line 426
    iget-object v2, p0, Lorg/apache/commons/digester/ExtendedBaseRules$1;->this$0:Lorg/apache/commons/digester/ExtendedBaseRules;

    invoke-static {v2}, Lorg/apache/commons/digester/ExtendedBaseRules;->access$000(Lorg/apache/commons/digester/ExtendedBaseRules;)Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 427
    .local v0, "i1":Ljava/lang/Integer;
    iget-object v2, p0, Lorg/apache/commons/digester/ExtendedBaseRules$1;->this$0:Lorg/apache/commons/digester/ExtendedBaseRules;

    invoke-static {v2}, Lorg/apache/commons/digester/ExtendedBaseRules;->access$000(Lorg/apache/commons/digester/ExtendedBaseRules;)Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 430
    .local v1, "i2":Ljava/lang/Integer;
    if-nez v0, :cond_20

    .line 431
    if-nez v1, :cond_1e

    .line 433
    const/4 v2, 0x0

    .line 444
    :goto_1d
    return v2

    .line 437
    :cond_1e
    const/4 v2, -0x1

    goto :goto_1d

    .line 440
    :cond_20
    if-nez v1, :cond_24

    .line 441
    const/4 v2, 0x1

    goto :goto_1d

    .line 444
    :cond_24
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    sub-int/2addr v2, v3

    goto :goto_1d
.end method
