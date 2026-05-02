.class Lorg/junit/experimental/max/MaxHistory$TestComparator;
.super Ljava/lang/Object;
.source "MaxHistory.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/junit/experimental/max/MaxHistory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TestComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lorg/junit/runner/Description;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/junit/experimental/max/MaxHistory;


# direct methods
.method private constructor <init>(Lorg/junit/experimental/max/MaxHistory;)V
    .registers 2

    .prologue
    .line 133
    iput-object p1, p0, Lorg/junit/experimental/max/MaxHistory$TestComparator;->this$0:Lorg/junit/experimental/max/MaxHistory;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/junit/experimental/max/MaxHistory;Lorg/junit/experimental/max/MaxHistory$1;)V
    .registers 3
    .param p1, "x0"    # Lorg/junit/experimental/max/MaxHistory;
    .param p2, "x1"    # Lorg/junit/experimental/max/MaxHistory$1;

    .prologue
    .line 133
    invoke-direct {p0, p1}, Lorg/junit/experimental/max/MaxHistory$TestComparator;-><init>(Lorg/junit/experimental/max/MaxHistory;)V

    return-void
.end method

.method private getFailure(Lorg/junit/runner/Description;)Ljava/lang/Long;
    .registers 5
    .param p1, "key"    # Lorg/junit/runner/Description;

    .prologue
    .line 150
    iget-object v1, p0, Lorg/junit/experimental/max/MaxHistory$TestComparator;->this$0:Lorg/junit/experimental/max/MaxHistory;

    invoke-virtual {v1, p1}, Lorg/junit/experimental/max/MaxHistory;->getFailureTimestamp(Lorg/junit/runner/Description;)Ljava/lang/Long;

    move-result-object v0

    .line 151
    .local v0, "result":Ljava/lang/Long;
    if-nez v0, :cond_e

    .line 152
    const-wide/16 v1, 0x0

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    .line 154
    .end local v0    # "result":Ljava/lang/Long;
    :cond_e
    return-object v0
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 133
    check-cast p1, Lorg/junit/runner/Description;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lorg/junit/runner/Description;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/junit/experimental/max/MaxHistory$TestComparator;->compare(Lorg/junit/runner/Description;Lorg/junit/runner/Description;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/junit/runner/Description;Lorg/junit/runner/Description;)I
    .registers 6
    .param p1, "o1"    # Lorg/junit/runner/Description;
    .param p2, "o2"    # Lorg/junit/runner/Description;

    .prologue
    .line 136
    iget-object v1, p0, Lorg/junit/experimental/max/MaxHistory$TestComparator;->this$0:Lorg/junit/experimental/max/MaxHistory;

    invoke-virtual {v1, p1}, Lorg/junit/experimental/max/MaxHistory;->isNewTest(Lorg/junit/runner/Description;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 137
    const/4 v0, -0x1

    .line 144
    :cond_9
    :goto_9
    return v0

    .line 139
    :cond_a
    iget-object v1, p0, Lorg/junit/experimental/max/MaxHistory$TestComparator;->this$0:Lorg/junit/experimental/max/MaxHistory;

    invoke-virtual {v1, p2}, Lorg/junit/experimental/max/MaxHistory;->isNewTest(Lorg/junit/runner/Description;)Z

    move-result v1

    if-eqz v1, :cond_14

    .line 140
    const/4 v0, 0x1

    goto :goto_9

    .line 143
    :cond_14
    invoke-direct {p0, p2}, Lorg/junit/experimental/max/MaxHistory$TestComparator;->getFailure(Lorg/junit/runner/Description;)Ljava/lang/Long;

    move-result-object v1

    invoke-direct {p0, p1}, Lorg/junit/experimental/max/MaxHistory$TestComparator;->getFailure(Lorg/junit/runner/Description;)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Long;->compareTo(Ljava/lang/Long;)I

    move-result v0

    .line 144
    .local v0, "result":I
    if-nez v0, :cond_9

    iget-object v1, p0, Lorg/junit/experimental/max/MaxHistory$TestComparator;->this$0:Lorg/junit/experimental/max/MaxHistory;

    invoke-virtual {v1, p1}, Lorg/junit/experimental/max/MaxHistory;->getTestDuration(Lorg/junit/runner/Description;)Ljava/lang/Long;

    move-result-object v1

    iget-object v2, p0, Lorg/junit/experimental/max/MaxHistory$TestComparator;->this$0:Lorg/junit/experimental/max/MaxHistory;

    invoke-virtual {v2, p2}, Lorg/junit/experimental/max/MaxHistory;->getTestDuration(Lorg/junit/runner/Description;)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Long;->compareTo(Ljava/lang/Long;)I

    move-result v0

    goto :goto_9
.end method
