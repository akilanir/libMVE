.class public Lorg/jivesoftware/smack/util/collections/EmptyMapIterator;
.super Lorg/jivesoftware/smack/util/collections/AbstractEmptyIterator;
.source "EmptyMapIterator.java"

# interfaces
.implements Lorg/jivesoftware/smack/util/collections/MapIterator;
.implements Lorg/jivesoftware/smack/util/collections/ResettableIterator;


# static fields
.field public static final INSTANCE:Lorg/jivesoftware/smack/util/collections/MapIterator;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 33
    new-instance v0, Lorg/jivesoftware/smack/util/collections/EmptyMapIterator;

    invoke-direct {v0}, Lorg/jivesoftware/smack/util/collections/EmptyMapIterator;-><init>()V

    sput-object v0, Lorg/jivesoftware/smack/util/collections/EmptyMapIterator;->INSTANCE:Lorg/jivesoftware/smack/util/collections/MapIterator;

    return-void
.end method

.method protected constructor <init>()V
    .registers 1

    .prologue
    .line 39
    invoke-direct {p0}, Lorg/jivesoftware/smack/util/collections/AbstractEmptyIterator;-><init>()V

    .line 40
    return-void
.end method


# virtual methods
.method public bridge synthetic add(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 26
    invoke-super {p0, p1}, Lorg/jivesoftware/smack/util/collections/AbstractEmptyIterator;->add(Ljava/lang/Object;)V

    return-void
.end method

.method public bridge synthetic getKey()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 26
    invoke-super {p0}, Lorg/jivesoftware/smack/util/collections/AbstractEmptyIterator;->getKey()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getValue()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 26
    invoke-super {p0}, Lorg/jivesoftware/smack/util/collections/AbstractEmptyIterator;->getValue()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic hasNext()Z
    .registers 2

    .prologue
    .line 26
    invoke-super {p0}, Lorg/jivesoftware/smack/util/collections/AbstractEmptyIterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic hasPrevious()Z
    .registers 2

    .prologue
    .line 26
    invoke-super {p0}, Lorg/jivesoftware/smack/util/collections/AbstractEmptyIterator;->hasPrevious()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 26
    invoke-super {p0}, Lorg/jivesoftware/smack/util/collections/AbstractEmptyIterator;->next()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic nextIndex()I
    .registers 2

    .prologue
    .line 26
    invoke-super {p0}, Lorg/jivesoftware/smack/util/collections/AbstractEmptyIterator;->nextIndex()I

    move-result v0

    return v0
.end method

.method public bridge synthetic previous()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 26
    invoke-super {p0}, Lorg/jivesoftware/smack/util/collections/AbstractEmptyIterator;->previous()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic previousIndex()I
    .registers 2

    .prologue
    .line 26
    invoke-super {p0}, Lorg/jivesoftware/smack/util/collections/AbstractEmptyIterator;->previousIndex()I

    move-result v0

    return v0
.end method

.method public bridge synthetic remove()V
    .registers 1

    .prologue
    .line 26
    invoke-super {p0}, Lorg/jivesoftware/smack/util/collections/AbstractEmptyIterator;->remove()V

    return-void
.end method

.method public bridge synthetic reset()V
    .registers 1

    .prologue
    .line 26
    invoke-super {p0}, Lorg/jivesoftware/smack/util/collections/AbstractEmptyIterator;->reset()V

    return-void
.end method

.method public bridge synthetic set(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 26
    invoke-super {p0, p1}, Lorg/jivesoftware/smack/util/collections/AbstractEmptyIterator;->set(Ljava/lang/Object;)V

    return-void
.end method

.method public bridge synthetic setValue(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 26
    invoke-super {p0, p1}, Lorg/jivesoftware/smack/util/collections/AbstractEmptyIterator;->setValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
