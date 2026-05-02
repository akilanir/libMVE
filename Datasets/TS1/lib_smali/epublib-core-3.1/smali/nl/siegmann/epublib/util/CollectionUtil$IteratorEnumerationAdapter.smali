.class Lnl/siegmann/epublib/util/CollectionUtil$IteratorEnumerationAdapter;
.super Ljava/lang/Object;
.source "CollectionUtil.java"

# interfaces
.implements Ljava/util/Enumeration;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnl/siegmann/epublib/util/CollectionUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "IteratorEnumerationAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Enumeration",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private iterator:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Iterator;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 18
    .local p0, "this":Lnl/siegmann/epublib/util/CollectionUtil$IteratorEnumerationAdapter;, "Lnl/siegmann/epublib/util/CollectionUtil$IteratorEnumerationAdapter<TT;>;"
    .local p1, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lnl/siegmann/epublib/util/CollectionUtil$IteratorEnumerationAdapter;->iterator:Ljava/util/Iterator;

    .line 20
    return-void
.end method


# virtual methods
.method public hasMoreElements()Z
    .registers 2

    .prologue
    .line 24
    .local p0, "this":Lnl/siegmann/epublib/util/CollectionUtil$IteratorEnumerationAdapter;, "Lnl/siegmann/epublib/util/CollectionUtil$IteratorEnumerationAdapter<TT;>;"
    iget-object v0, p0, Lnl/siegmann/epublib/util/CollectionUtil$IteratorEnumerationAdapter;->iterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public nextElement()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 29
    .local p0, "this":Lnl/siegmann/epublib/util/CollectionUtil$IteratorEnumerationAdapter;, "Lnl/siegmann/epublib/util/CollectionUtil$IteratorEnumerationAdapter<TT;>;"
    iget-object v0, p0, Lnl/siegmann/epublib/util/CollectionUtil$IteratorEnumerationAdapter;->iterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
