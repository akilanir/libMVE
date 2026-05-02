.class Lfreemarker/ext/util/IdentityHashMap$1;
.super Ljava/util/AbstractSet;
.source "IdentityHashMap.java"


# instance fields
.field private final this$0:Lfreemarker/ext/util/IdentityHashMap;


# direct methods
.method constructor <init>(Lfreemarker/ext/util/IdentityHashMap;)V
    .registers 2

    .prologue
    .line 522
    invoke-direct {p0}, Ljava/util/AbstractSet;-><init>()V

    iput-object p1, p0, Lfreemarker/ext/util/IdentityHashMap$1;->this$0:Lfreemarker/ext/util/IdentityHashMap;

    return-void
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    .line 543
    iget-object v0, p0, Lfreemarker/ext/util/IdentityHashMap$1;->this$0:Lfreemarker/ext/util/IdentityHashMap;

    invoke-virtual {v0}, Lfreemarker/ext/util/IdentityHashMap;->clear()V

    .line 544
    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 533
    iget-object v0, p0, Lfreemarker/ext/util/IdentityHashMap$1;->this$0:Lfreemarker/ext/util/IdentityHashMap;

    invoke-virtual {v0, p1}, Lfreemarker/ext/util/IdentityHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 3

    .prologue
    .line 525
    iget-object v0, p0, Lfreemarker/ext/util/IdentityHashMap$1;->this$0:Lfreemarker/ext/util/IdentityHashMap;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lfreemarker/ext/util/IdentityHashMap;->access$000(Lfreemarker/ext/util/IdentityHashMap;I)Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 537
    iget-object v1, p0, Lfreemarker/ext/util/IdentityHashMap$1;->this$0:Lfreemarker/ext/util/IdentityHashMap;

    invoke-static {v1}, Lfreemarker/ext/util/IdentityHashMap;->access$100(Lfreemarker/ext/util/IdentityHashMap;)I

    move-result v0

    .line 538
    .local v0, "oldSize":I
    iget-object v1, p0, Lfreemarker/ext/util/IdentityHashMap$1;->this$0:Lfreemarker/ext/util/IdentityHashMap;

    invoke-virtual {v1, p1}, Lfreemarker/ext/util/IdentityHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 539
    iget-object v1, p0, Lfreemarker/ext/util/IdentityHashMap$1;->this$0:Lfreemarker/ext/util/IdentityHashMap;

    invoke-static {v1}, Lfreemarker/ext/util/IdentityHashMap;->access$100(Lfreemarker/ext/util/IdentityHashMap;)I

    move-result v1

    if-eq v1, v0, :cond_15

    const/4 v1, 0x1

    :goto_14
    return v1

    :cond_15
    const/4 v1, 0x0

    goto :goto_14
.end method

.method public size()I
    .registers 2

    .prologue
    .line 529
    iget-object v0, p0, Lfreemarker/ext/util/IdentityHashMap$1;->this$0:Lfreemarker/ext/util/IdentityHashMap;

    invoke-static {v0}, Lfreemarker/ext/util/IdentityHashMap;->access$100(Lfreemarker/ext/util/IdentityHashMap;)I

    move-result v0

    return v0
.end method
