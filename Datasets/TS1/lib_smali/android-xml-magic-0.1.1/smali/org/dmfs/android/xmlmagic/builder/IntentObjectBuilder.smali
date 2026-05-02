.class public Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder;
.super Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder",
        "<",
        "Landroid/content/Intent;",
        ">;"
    }
.end annotation


# static fields
.field private static final ACTION:Lorg/dmfs/xmlobjects/ElementDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final CATEGORY:Lorg/dmfs/xmlobjects/ElementDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final CLASS:Lorg/dmfs/xmlobjects/ElementDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final CONTENT_TYPE:Lorg/dmfs/xmlobjects/ElementDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final DATA:Lorg/dmfs/xmlobjects/ElementDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field

.field private static final EXTRAS:Lorg/dmfs/xmlobjects/ElementDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Landroid/os/Bundle;",
            ">;"
        }
    .end annotation
.end field

.field public static final INSTANCE:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder;

.field private static final PACKAGE:Lorg/dmfs/xmlobjects/ElementDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder;

    invoke-direct {v0}, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder;-><init>()V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder;->INSTANCE:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder;

    const-string v0, "http://dmfs.org/ns/android-xml-magic"

    const-string v1, "action"

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/AndroidStringObjectBuilder;->INSTANCE:Lorg/dmfs/android/xmlmagic/builder/AndroidStringObjectBuilder;

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/ElementDescriptor;->register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder;->ACTION:Lorg/dmfs/xmlobjects/ElementDescriptor;

    const-string v0, "http://dmfs.org/ns/android-xml-magic"

    const-string v1, "package"

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/AndroidStringObjectBuilder;->INSTANCE:Lorg/dmfs/android/xmlmagic/builder/AndroidStringObjectBuilder;

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/ElementDescriptor;->register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder;->PACKAGE:Lorg/dmfs/xmlobjects/ElementDescriptor;

    const-string v0, "http://dmfs.org/ns/android-xml-magic"

    const-string v1, "class"

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/AndroidStringObjectBuilder;->INSTANCE:Lorg/dmfs/android/xmlmagic/builder/AndroidStringObjectBuilder;

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/ElementDescriptor;->register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder;->CLASS:Lorg/dmfs/xmlobjects/ElementDescriptor;

    const-string v0, "http://dmfs.org/ns/android-xml-magic"

    const-string v1, "data"

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->INSTANCE:Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/ElementDescriptor;->register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder;->DATA:Lorg/dmfs/xmlobjects/ElementDescriptor;

    const-string v0, "http://dmfs.org/ns/android-xml-magic"

    const-string v1, "extras"

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder;->INSTANCE:Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder;

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/ElementDescriptor;->register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder;->EXTRAS:Lorg/dmfs/xmlobjects/ElementDescriptor;

    const-string v0, "http://dmfs.org/ns/android-xml-magic"

    const-string v1, "content-type"

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/AndroidStringObjectBuilder;->INSTANCE:Lorg/dmfs/android/xmlmagic/builder/AndroidStringObjectBuilder;

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/ElementDescriptor;->register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder;->CONTENT_TYPE:Lorg/dmfs/xmlobjects/ElementDescriptor;

    const-string v0, "http://dmfs.org/ns/android-xml-magic"

    const-string v1, "category"

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/AndroidStringObjectBuilder;->INSTANCE:Lorg/dmfs/android/xmlmagic/builder/AndroidStringObjectBuilder;

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/ElementDescriptor;->register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder;->CATEGORY:Lorg/dmfs/xmlobjects/ElementDescriptor;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder;-><init>()V

    return-void
.end method


# virtual methods
.method public get(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/content/Intent;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/content/Intent;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Landroid/content/Intent;",
            ">;",
            "Landroid/content/Intent;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Landroid/content/Intent;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    return-object v0
.end method

.method public bridge synthetic get(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    check-cast p2, Landroid/content/Intent;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder;->get(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/content/Intent;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public update(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/content/Intent;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/content/Intent;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Landroid/content/Intent;",
            ">;",
            "Landroid/content/Intent;",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TT;>;TT;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Landroid/content/Intent;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    if-nez p2, :cond_7

    new-instance p2, Landroid/content/Intent;

    invoke-direct {p2}, Landroid/content/Intent;-><init>()V

    :cond_7
    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder;->ACTION:Lorg/dmfs/xmlobjects/ElementDescriptor;

    if-ne p3, v0, :cond_11

    check-cast p4, Ljava/lang/String;

    invoke-virtual {p2, p4}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    :cond_10
    :goto_10
    return-object p2

    :cond_11
    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder;->PACKAGE:Lorg/dmfs/xmlobjects/ElementDescriptor;

    if-ne p3, v0, :cond_1b

    check-cast p4, Ljava/lang/String;

    invoke-virtual {p2, p4}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_10

    :cond_1b
    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder;->CLASS:Lorg/dmfs/xmlobjects/ElementDescriptor;

    if-ne p3, v0, :cond_29

    invoke-virtual {p2}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    move-result-object v0

    check-cast p4, Ljava/lang/String;

    invoke-virtual {p2, v0, p4}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_10

    :cond_29
    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder;->DATA:Lorg/dmfs/xmlobjects/ElementDescriptor;

    if-ne p3, v0, :cond_33

    check-cast p4, Landroid/net/Uri;

    invoke-virtual {p2, p4}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    goto :goto_10

    :cond_33
    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder;->EXTRAS:Lorg/dmfs/xmlobjects/ElementDescriptor;

    if-ne p3, v0, :cond_3d

    check-cast p4, Landroid/os/Bundle;

    invoke-virtual {p2, p4}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    goto :goto_10

    :cond_3d
    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder;->CONTENT_TYPE:Lorg/dmfs/xmlobjects/ElementDescriptor;

    if-ne p3, v0, :cond_47

    check-cast p4, Ljava/lang/String;

    invoke-virtual {p2, p4}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_10

    :cond_47
    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder;->CATEGORY:Lorg/dmfs/xmlobjects/ElementDescriptor;

    if-ne p3, v0, :cond_10

    check-cast p4, Ljava/lang/String;

    invoke-virtual {p2, p4}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_10
.end method

.method public update(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/content/Intent;Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/content/Intent;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Landroid/content/Intent;",
            ">;",
            "Landroid/content/Intent;",
            "Lorg/dmfs/xmlobjects/QualifiedName;",
            "Ljava/lang/String;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Landroid/content/Intent;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    const-string v0, "http://dmfs.org/ns/android-xml-magic"

    iget-object v1, p3, Lorg/dmfs/xmlobjects/QualifiedName;->namespace:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_24

    iget-object v0, p3, Lorg/dmfs/xmlobjects/QualifiedName;->name:Ljava/lang/String;

    invoke-static {v0}, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->get(Ljava/lang/String;)Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;

    move-result-object v0

    if-eqz v0, :cond_24

    invoke-virtual {p0, p3, p5}, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder;->getBooleanAttr(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/pull/ParserContext;)Z

    move-result v1

    if-eqz v1, :cond_25

    invoke-virtual {p2}, Landroid/content/Intent;->getFlags()I

    move-result v1

    invoke-virtual {v0}, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->get()I

    move-result v0

    or-int/2addr v0, v1

    :goto_21
    invoke-virtual {p2, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    :cond_24
    return-object p2

    :cond_25
    invoke-virtual {p2}, Landroid/content/Intent;->getFlags()I

    move-result v1

    invoke-virtual {v0}, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder$Flags;->get()I

    move-result v0

    xor-int/lit8 v0, v0, -0x1

    and-int/2addr v0, v1

    goto :goto_21
.end method

.method public bridge synthetic update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    move-object v2, p2

    check-cast v2, Landroid/content/Intent;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder;->update(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/content/Intent;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/content/Intent;

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

    check-cast v2, Landroid/content/Intent;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder;->update(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/content/Intent;Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method
