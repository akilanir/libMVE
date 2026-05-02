.class public Lorg/dmfs/android/xmlmagic/builder/RecyclingReflectionObjectBuilder;
.super Lorg/dmfs/android/xmlmagic/builder/ReflectionObjectBuilder;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/dmfs/android/xmlmagic/builder/ReflectionObjectBuilder",
        "<TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/Class;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<TT;>;)V"
        }
    .end annotation

    invoke-direct {p0, p1}, Lorg/dmfs/android/xmlmagic/builder/ReflectionObjectBuilder;-><init>(Ljava/lang/Class;)V

    return-void
.end method


# virtual methods
.method public get(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TT;>;TT;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    if-eqz p2, :cond_d

    instance-of v0, p2, Lorg/dmfs/xmlobjects/pull/Recyclable;

    if-eqz v0, :cond_c

    move-object v0, p2

    check-cast v0, Lorg/dmfs/xmlobjects/pull/Recyclable;

    invoke-interface {v0}, Lorg/dmfs/xmlobjects/pull/Recyclable;->recycle()V

    :cond_c
    :goto_c
    return-object p2

    :cond_d
    invoke-super {p0, p1, p2, p3}, Lorg/dmfs/android/xmlmagic/builder/ReflectionObjectBuilder;->get(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;

    move-result-object p2

    goto :goto_c
.end method
