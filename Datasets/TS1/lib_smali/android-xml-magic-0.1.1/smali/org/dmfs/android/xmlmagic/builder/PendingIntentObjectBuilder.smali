.class public Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder;
.super Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$PendingIntentDescriptor;,
        Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;,
        Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$IntentType;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder",
        "<",
        "Landroid/app/PendingIntent;",
        ">;"
    }
.end annotation


# static fields
.field private static final ATTR_INTENT_TYPE:Lorg/dmfs/xmlobjects/QualifiedName;

.field private static final ATTR_REQUEST_CODE:Lorg/dmfs/xmlobjects/QualifiedName;

.field public static final INSTANCE:Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder;

    invoke-direct {v0}, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder;-><init>()V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder;->INSTANCE:Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder;

    const-string v0, "intent-type"

    invoke-static {v0}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder;->ATTR_INTENT_TYPE:Lorg/dmfs/xmlobjects/QualifiedName;

    const-string v0, "request-code"

    invoke-static {v0}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder;->ATTR_REQUEST_CODE:Lorg/dmfs/xmlobjects/QualifiedName;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder;-><init>()V

    return-void
.end method

.method private getDescriptor(Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$PendingIntentDescriptor;
    .registers 3

    invoke-virtual {p1}, Lorg/dmfs/xmlobjects/pull/ParserContext;->getState()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$PendingIntentDescriptor;

    return-object v0
.end method


# virtual methods
.method public finish(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/app/PendingIntent;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/app/PendingIntent;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Landroid/app/PendingIntent;",
            ">;",
            "Landroid/app/PendingIntent;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Landroid/app/PendingIntent;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    invoke-direct {p0, p3}, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder;->getDescriptor(Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$PendingIntentDescriptor;

    move-result-object v0

    iget-object v1, v0, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$PendingIntentDescriptor;->intentType:Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$IntentType;

    move-object v0, p3

    check-cast v0, Lorg/dmfs/android/xmlmagic/AndroidParserContext;

    invoke-virtual {v0}, Lorg/dmfs/android/xmlmagic/AndroidParserContext;->getAppContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, p3}, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder;->getDescriptor(Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$PendingIntentDescriptor;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$IntentType;->getPendingIntent(Landroid/content/Context;Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$PendingIntentDescriptor;)Landroid/app/PendingIntent;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic finish(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    check-cast p2, Landroid/app/PendingIntent;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder;->finish(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/app/PendingIntent;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/app/PendingIntent;

    move-result-object v0

    return-object v0
.end method

.method public get(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/app/PendingIntent;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/app/PendingIntent;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Landroid/app/PendingIntent;",
            ">;",
            "Landroid/app/PendingIntent;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Landroid/app/PendingIntent;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    const/4 v1, 0x0

    instance-of v0, p3, Lorg/dmfs/android/xmlmagic/AndroidParserContext;

    if-nez v0, :cond_d

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "ParserContext must be an AndroidParserContext to build a PendingIntent"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_d
    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$PendingIntentDescriptor;

    invoke-direct {v0, v1}, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$PendingIntentDescriptor;-><init>(Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$1;)V

    invoke-virtual {p3, v0}, Lorg/dmfs/xmlobjects/pull/ParserContext;->setState(Ljava/lang/Object;)V

    return-object v1
.end method

.method public bridge synthetic get(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    check-cast p2, Landroid/app/PendingIntent;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder;->get(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/app/PendingIntent;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/app/PendingIntent;

    move-result-object v0

    return-object v0
.end method

.method public update(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/app/PendingIntent;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/app/PendingIntent;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Landroid/app/PendingIntent;",
            ">;",
            "Landroid/app/PendingIntent;",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TV;>;TV;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Landroid/app/PendingIntent;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    sget-object v0, Lorg/dmfs/android/xmlmagic/Model;->INTENT:Lorg/dmfs/xmlobjects/ElementDescriptor;

    if-ne p3, v0, :cond_c

    invoke-direct {p0, p5}, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder;->getDescriptor(Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$PendingIntentDescriptor;

    move-result-object v0

    check-cast p4, Landroid/content/Intent;

    iput-object p4, v0, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$PendingIntentDescriptor;->intent:Landroid/content/Intent;

    :cond_c
    return-object p2
.end method

.method public update(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/app/PendingIntent;Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/app/PendingIntent;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Landroid/app/PendingIntent;",
            ">;",
            "Landroid/app/PendingIntent;",
            "Lorg/dmfs/xmlobjects/QualifiedName;",
            "Ljava/lang/String;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Landroid/app/PendingIntent;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder;->ATTR_REQUEST_CODE:Lorg/dmfs/xmlobjects/QualifiedName;

    if-ne v0, p3, :cond_14

    invoke-direct {p0, p5}, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder;->getDescriptor(Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$PendingIntentDescriptor;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, p3, v1, p5}, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder;->getIntegerAttr(Lorg/dmfs/xmlobjects/QualifiedName;ZLorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iput v1, v0, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$PendingIntentDescriptor;->requestCode:I

    :cond_13
    :goto_13
    return-object p2

    :cond_14
    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder;->ATTR_INTENT_TYPE:Lorg/dmfs/xmlobjects/QualifiedName;

    if-ne v0, p3, :cond_23

    invoke-direct {p0, p5}, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder;->getDescriptor(Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$PendingIntentDescriptor;

    move-result-object v0

    invoke-static {p4}, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$IntentType;->valueOf(Ljava/lang/String;)Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$IntentType;

    move-result-object v1

    iput-object v1, v0, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$PendingIntentDescriptor;->intentType:Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$IntentType;

    goto :goto_13

    :cond_23
    const-string v0, "http://dmfs.org/ns/android-xml-magic"

    iget-object v1, p3, Lorg/dmfs/xmlobjects/QualifiedName;->namespace:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    iget-object v0, p3, Lorg/dmfs/xmlobjects/QualifiedName;->name:Ljava/lang/String;

    invoke-static {v0}, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;->get(Ljava/lang/String;)Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;

    move-result-object v0

    if-eqz v0, :cond_13

    invoke-virtual {p0, p3, p5}, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder;->getBooleanAttr(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/pull/ParserContext;)Z

    move-result v1

    if-eqz v1, :cond_49

    invoke-direct {p0, p5}, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder;->getDescriptor(Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$PendingIntentDescriptor;

    move-result-object v1

    iget v2, v1, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$PendingIntentDescriptor;->flags:I

    invoke-virtual {v0}, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;->get()I

    move-result v0

    or-int/2addr v0, v2

    iput v0, v1, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$PendingIntentDescriptor;->flags:I

    goto :goto_13

    :cond_49
    invoke-direct {p0, p5}, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder;->getDescriptor(Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$PendingIntentDescriptor;

    move-result-object v1

    iget v2, v1, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$PendingIntentDescriptor;->flags:I

    invoke-virtual {v0}, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;->get()I

    move-result v0

    xor-int/lit8 v0, v0, -0x1

    and-int/2addr v0, v2

    iput v0, v1, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$PendingIntentDescriptor;->flags:I

    goto :goto_13
.end method

.method public bridge synthetic update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    move-object v2, p2

    check-cast v2, Landroid/app/PendingIntent;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder;->update(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/app/PendingIntent;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/app/PendingIntent;

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

    check-cast v2, Landroid/app/PendingIntent;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder;->update(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/app/PendingIntent;Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/app/PendingIntent;

    move-result-object v0

    return-object v0
.end method
