.class Lfreemarker/ext/util/IdentityHashMap$2;
.super Ljava/util/AbstractCollection;
.source "IdentityHashMap.java"


# instance fields
.field private final this$0:Lfreemarker/ext/util/IdentityHashMap;


# direct methods
.method constructor <init>(Lfreemarker/ext/util/IdentityHashMap;)V
    .registers 2

    .prologue
    .line 566
    invoke-direct {p0}, Ljava/util/AbstractCollection;-><init>()V

    iput-object p1, p0, Lfreemarker/ext/util/IdentityHashMap$2;->this$0:Lfreemarker/ext/util/IdentityHashMap;

    return-void
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    .line 581
    iget-object v0, p0, Lfreemarker/ext/util/IdentityHashMap$2;->this$0:Lfreemarker/ext/util/IdentityHashMap;

    invoke-virtual {v0}, Lfreemarker/ext/util/IdentityHashMap;->clear()V

    .line 582
    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 577
    iget-object v0, p0, Lfreemarker/ext/util/IdentityHashMap$2;->this$0:Lfreemarker/ext/util/IdentityHashMap;

    invoke-virtual {v0, p1}, Lfreemarker/ext/util/IdentityHashMap;->containsValue(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 3

    .prologue
    .line 569
    iget-object v0, p0, Lfreemarker/ext/util/IdentityHashMap$2;->this$0:Lfreemarker/ext/util/IdentityHashMap;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lfreemarker/ext/util/IdentityHashMap;->access$000(Lfreemarker/ext/util/IdentityHashMap;I)Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 573
    iget-object v0, p0, Lfreemarker/ext/util/IdentityHashMap$2;->this$0:Lfreemarker/ext/util/IdentityHashMap;

    invoke-static {v0}, Lfreemarker/ext/util/IdentityHashMap;->access$100(Lfreemarker/ext/util/IdentityHashMap;)I

    move-result v0

    return v0
.end method
