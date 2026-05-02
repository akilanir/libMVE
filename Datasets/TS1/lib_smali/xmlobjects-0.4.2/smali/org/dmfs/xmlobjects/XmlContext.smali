.class public Lorg/dmfs/xmlobjects/XmlContext;
.super Ljava/lang/Object;


# instance fields
.field final DESCRIPTOR_MAP:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/dmfs/xmlobjects/QualifiedName;",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<*>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    iput-object v0, p0, Lorg/dmfs/xmlobjects/XmlContext;->DESCRIPTOR_MAP:Ljava/util/Map;

    return-void
.end method
