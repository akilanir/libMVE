.class public Lorg/dmfs/xmlobjects/pull/XmlPath;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field public mPathElements:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<*>;>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lorg/dmfs/xmlobjects/pull/XmlPath;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p1, Lorg/dmfs/xmlobjects/pull/XmlPath;->mPathElements:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/LinkedList;

    iput-object v0, p0, Lorg/dmfs/xmlobjects/pull/XmlPath;->mPathElements:Ljava/util/LinkedList;

    return-void
.end method

.method public varargs constructor <init>([Lorg/dmfs/xmlobjects/ElementDescriptor;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<*>;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    iput-object v1, p0, Lorg/dmfs/xmlobjects/pull/XmlPath;->mPathElements:Ljava/util/LinkedList;

    if-eqz p1, :cond_18

    array-length v2, p1

    const/4 v0, 0x0

    :goto_e
    if-ge v0, v2, :cond_18

    aget-object v3, p1, v0

    invoke-virtual {v1, v3}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_e

    :cond_18
    return-void
.end method


# virtual methods
.method append(Lorg/dmfs/xmlobjects/ElementDescriptor;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<*>;)V"
        }
    .end annotation

    iget-object v0, p0, Lorg/dmfs/xmlobjects/pull/XmlPath;->mPathElements:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    return-void
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    invoke-virtual {p0}, Lorg/dmfs/xmlobjects/pull/XmlPath;->clone()Lorg/dmfs/xmlobjects/pull/XmlPath;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/dmfs/xmlobjects/pull/XmlPath;
    .registers 2

    new-instance v0, Lorg/dmfs/xmlobjects/pull/XmlPath;

    invoke-direct {v0, p0}, Lorg/dmfs/xmlobjects/pull/XmlPath;-><init>(Lorg/dmfs/xmlobjects/pull/XmlPath;)V

    return-object v0
.end method

.method public length()I
    .registers 2

    iget-object v0, p0, Lorg/dmfs/xmlobjects/pull/XmlPath;->mPathElements:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    return v0
.end method

.method public matches(Lorg/dmfs/xmlobjects/pull/XmlPath;)Z
    .registers 4

    iget-object v0, p0, Lorg/dmfs/xmlobjects/pull/XmlPath;->mPathElements:Ljava/util/LinkedList;

    iget-object v1, p1, Lorg/dmfs/xmlobjects/pull/XmlPath;->mPathElements:Ljava/util/LinkedList;

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method peek()Lorg/dmfs/xmlobjects/ElementDescriptor;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<*>;"
        }
    .end annotation

    iget-object v0, p0, Lorg/dmfs/xmlobjects/pull/XmlPath;->mPathElements:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/xmlobjects/ElementDescriptor;

    return-object v0
.end method

.method peekLast()Lorg/dmfs/xmlobjects/ElementDescriptor;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<*>;"
        }
    .end annotation

    iget-object v0, p0, Lorg/dmfs/xmlobjects/pull/XmlPath;->mPathElements:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->peekLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/xmlobjects/ElementDescriptor;

    return-object v0
.end method

.method pop()Lorg/dmfs/xmlobjects/ElementDescriptor;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<*>;"
        }
    .end annotation

    iget-object v0, p0, Lorg/dmfs/xmlobjects/pull/XmlPath;->mPathElements:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/xmlobjects/ElementDescriptor;

    return-object v0
.end method
