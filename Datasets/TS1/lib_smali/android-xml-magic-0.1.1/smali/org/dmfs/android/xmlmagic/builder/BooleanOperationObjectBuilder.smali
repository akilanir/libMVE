.class public Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder;
.super Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder",
        "<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# static fields
.field private static final ATTR_INVERT:Lorg/dmfs/xmlobjects/QualifiedName;


# instance fields
.field private final mOperation:Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-string v0, "invert"

    invoke-static {v0}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder;->ATTR_INVERT:Lorg/dmfs/xmlobjects/QualifiedName;

    return-void
.end method

.method public constructor <init>(Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;)V
    .registers 2

    invoke-direct {p0}, Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder;-><init>()V

    iput-object p1, p0, Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder;->mOperation:Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;

    return-void
.end method


# virtual methods
.method public finish(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Boolean;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Boolean;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ljava/lang/Boolean;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Ljava/lang/Boolean;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    const/4 v1, 0x0

    if-nez p2, :cond_7

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    :cond_7
    invoke-virtual {p3}, Lorg/dmfs/xmlobjects/pull/ParserContext;->getState()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_21

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_1f

    const/4 v0, 0x1

    :goto_1a
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :cond_1f
    move v0, v1

    goto :goto_1a

    :cond_21
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    goto :goto_1a
.end method

.method public bridge synthetic finish(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder;->finish(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Boolean;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public get(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Boolean;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Boolean;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ljava/lang/Boolean;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Ljava/lang/Boolean;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p3, v0}, Lorg/dmfs/xmlobjects/pull/ParserContext;->setState(Ljava/lang/Object;)V

    const/4 v0, 0x0

    return-object v0
.end method

.method public bridge synthetic get(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder;->get(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Boolean;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Boolean;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Boolean;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ljava/lang/Boolean;",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TV;>;TV;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Ljava/lang/Boolean;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    instance-of v0, p4, Ljava/lang/Boolean;

    if-nez v0, :cond_5

    :goto_4
    return-object p2

    :cond_5
    if-nez p2, :cond_b

    check-cast p4, Ljava/lang/Boolean;

    move-object p2, p4

    goto :goto_4

    :cond_b
    iget-object v0, p0, Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder;->mOperation:Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    check-cast p4, Ljava/lang/Boolean;

    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;->calculate(ZZ)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    goto :goto_4
.end method

.method public update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Boolean;Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Boolean;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ljava/lang/Boolean;",
            "Lorg/dmfs/xmlobjects/QualifiedName;",
            "Ljava/lang/String;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Ljava/lang/Boolean;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder;->ATTR_INVERT:Lorg/dmfs/xmlobjects/QualifiedName;

    if-ne p3, v0, :cond_f

    invoke-virtual {p0, p3, p5}, Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder;->getBooleanAttr(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/pull/ParserContext;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p5, v0}, Lorg/dmfs/xmlobjects/pull/ParserContext;->setState(Ljava/lang/Object;)V

    :cond_f
    return-object p2
.end method

.method public bridge synthetic update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    move-object v2, p2

    check-cast v2, Ljava/lang/Boolean;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder;->update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Boolean;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    move-object v2, p2

    check-cast v2, Ljava/lang/Boolean;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder;->update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Boolean;Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method
