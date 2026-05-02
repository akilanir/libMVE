.class Lch/qos/logback/core/spi/AbstractComponentTracker$2;
.super Ljava/lang/Object;

# interfaces
.implements Lch/qos/logback/core/spi/AbstractComponentTracker$RemovalPredicator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lch/qos/logback/core/spi/AbstractComponentTracker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lch/qos/logback/core/spi/AbstractComponentTracker$RemovalPredicator",
        "<TC;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lch/qos/logback/core/spi/AbstractComponentTracker;


# direct methods
.method constructor <init>(Lch/qos/logback/core/spi/AbstractComponentTracker;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/spi/AbstractComponentTracker$2;->this$0:Lch/qos/logback/core/spi/AbstractComponentTracker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isSlatedForRemoval(Lch/qos/logback/core/spi/AbstractComponentTracker$Entry;J)Z
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lch/qos/logback/core/spi/AbstractComponentTracker$Entry",
            "<TC;>;J)Z"
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/spi/AbstractComponentTracker$2;->this$0:Lch/qos/logback/core/spi/AbstractComponentTracker;

    # invokes: Lch/qos/logback/core/spi/AbstractComponentTracker;->isEntryStale(Lch/qos/logback/core/spi/AbstractComponentTracker$Entry;J)Z
    invoke-static {v0, p1, p2, p3}, Lch/qos/logback/core/spi/AbstractComponentTracker;->access$000(Lch/qos/logback/core/spi/AbstractComponentTracker;Lch/qos/logback/core/spi/AbstractComponentTracker$Entry;J)Z

    move-result v0

    return v0
.end method
