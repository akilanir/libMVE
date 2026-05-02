.class public Lorg/dmfs/xmlobjects/builder/QualifiedNameObjectBuilder;
.super Lorg/dmfs/xmlobjects/builder/AbstractObjectBuilder;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/dmfs/xmlobjects/builder/AbstractObjectBuilder",
        "<",
        "Lorg/dmfs/xmlobjects/QualifiedName;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lorg/dmfs/xmlobjects/builder/QualifiedNameObjectBuilder;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lorg/dmfs/xmlobjects/builder/QualifiedNameObjectBuilder;

    invoke-direct {v0}, Lorg/dmfs/xmlobjects/builder/QualifiedNameObjectBuilder;-><init>()V

    sput-object v0, Lorg/dmfs/xmlobjects/builder/QualifiedNameObjectBuilder;->INSTANCE:Lorg/dmfs/xmlobjects/builder/QualifiedNameObjectBuilder;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lorg/dmfs/xmlobjects/builder/AbstractObjectBuilder;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic get(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    check-cast p2, Lorg/dmfs/xmlobjects/QualifiedName;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/xmlobjects/builder/QualifiedNameObjectBuilder;->get(Lorg/dmfs/xmlobjects/ElementDescriptor;Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    return-object v0
.end method

.method public get(Lorg/dmfs/xmlobjects/ElementDescriptor;Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/xmlobjects/QualifiedName;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Lorg/dmfs/xmlobjects/QualifiedName;",
            ">;",
            "Lorg/dmfs/xmlobjects/QualifiedName;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Lorg/dmfs/xmlobjects/QualifiedName;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    iget-object v0, p1, Lorg/dmfs/xmlobjects/ElementDescriptor;->qualifiedName:Lorg/dmfs/xmlobjects/QualifiedName;

    return-object v0
.end method
