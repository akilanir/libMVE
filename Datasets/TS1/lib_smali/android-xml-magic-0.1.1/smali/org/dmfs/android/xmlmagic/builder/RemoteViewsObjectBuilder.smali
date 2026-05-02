.class public Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder;
.super Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder",
        "<",
        "Landroid/widget/RemoteViews;",
        ">;"
    }
.end annotation


# static fields
.field private static final ATTR_ID:Lorg/dmfs/xmlobjects/QualifiedName;

.field private static final ATTR_LAYOUT:Lorg/dmfs/xmlobjects/QualifiedName;

.field private static final ATTR_METHOD:Lorg/dmfs/xmlobjects/QualifiedName;

.field private static final BUILDER:Lorg/dmfs/xmlobjects/builder/IObjectBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/builder/IObjectBuilder",
            "<",
            "Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;",
            ">;"
        }
    .end annotation
.end field

.field public static final INSTANCE:Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder;

.field private static final REMOTE_ONCLICK:Lorg/dmfs/xmlobjects/ElementDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;",
            ">;"
        }
    .end annotation
.end field

.field private static final REMOTE_SET_TEXT:Lorg/dmfs/xmlobjects/ElementDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder;

    invoke-direct {v0}, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder;-><init>()V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder;->INSTANCE:Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder;

    const-string v0, "layout"

    invoke-static {v0}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder;->ATTR_LAYOUT:Lorg/dmfs/xmlobjects/QualifiedName;

    const-string v0, "id"

    invoke-static {v0}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder;->ATTR_ID:Lorg/dmfs/xmlobjects/QualifiedName;

    const-string v0, "method"

    invoke-static {v0}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder;->ATTR_METHOD:Lorg/dmfs/xmlobjects/QualifiedName;

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$1;

    invoke-direct {v0}, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$1;-><init>()V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder;->BUILDER:Lorg/dmfs/xmlobjects/builder/IObjectBuilder;

    const-string v0, "http://dmfs.org/ns/android-xml-magic"

    const-string v1, "remote-onclick"

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder;->BUILDER:Lorg/dmfs/xmlobjects/builder/IObjectBuilder;

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/ElementDescriptor;->register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder;->REMOTE_ONCLICK:Lorg/dmfs/xmlobjects/ElementDescriptor;

    const-string v0, "http://dmfs.org/ns/android-xml-magic"

    const-string v1, "remote-set-text"

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder;->BUILDER:Lorg/dmfs/xmlobjects/builder/IObjectBuilder;

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/ElementDescriptor;->register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder;->REMOTE_SET_TEXT:Lorg/dmfs/xmlobjects/ElementDescriptor;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder;-><init>()V

    return-void
.end method

.method static synthetic access$100()Lorg/dmfs/xmlobjects/QualifiedName;
    .registers 1

    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder;->ATTR_ID:Lorg/dmfs/xmlobjects/QualifiedName;

    return-object v0
.end method

.method static synthetic access$200()Lorg/dmfs/xmlobjects/QualifiedName;
    .registers 1

    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder;->ATTR_METHOD:Lorg/dmfs/xmlobjects/QualifiedName;

    return-object v0
.end method


# virtual methods
.method public update(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/widget/RemoteViews;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/widget/RemoteViews;
    .registers 8
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Landroid/widget/RemoteViews;",
            ">;",
            "Landroid/widget/RemoteViews;",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TV;>;TV;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Landroid/widget/RemoteViews;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    iget-object v0, p3, Lorg/dmfs/xmlobjects/ElementDescriptor;->builder:Lorg/dmfs/xmlobjects/builder/IObjectBuilder;

    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder;->BUILDER:Lorg/dmfs/xmlobjects/builder/IObjectBuilder;

    if-eq v0, v1, :cond_7

    :cond_6
    :goto_6
    return-object p2

    :cond_7
    check-cast p4, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;

    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder;->REMOTE_ONCLICK:Lorg/dmfs/xmlobjects/ElementDescriptor;

    if-ne p3, v0, :cond_33

    iget-object v0, p4, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;->descriptor:Lorg/dmfs/xmlobjects/ElementDescriptor;

    sget-object v1, Lorg/dmfs/android/xmlmagic/Model;->PENDING_INTENT:Lorg/dmfs/xmlobjects/ElementDescriptor;

    if-ne v0, v1, :cond_1d

    iget v1, p4, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;->viewId:I

    iget-object v0, p4, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;->value:Ljava/lang/Object;

    check-cast v0, Landroid/app/PendingIntent;

    invoke-virtual {p2, v1, v0}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    goto :goto_6

    :cond_1d
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-le v0, v1, :cond_6

    iget-object v0, p4, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;->descriptor:Lorg/dmfs/xmlobjects/ElementDescriptor;

    sget-object v1, Lorg/dmfs/android/xmlmagic/Model;->INTENT:Lorg/dmfs/xmlobjects/ElementDescriptor;

    if-ne v0, v1, :cond_6

    iget v1, p4, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;->viewId:I

    iget-object v0, p4, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;->value:Ljava/lang/Object;

    check-cast v0, Landroid/content/Intent;

    invoke-virtual {p2, v1, v0}, Landroid/widget/RemoteViews;->setOnClickFillInIntent(ILandroid/content/Intent;)V

    goto :goto_6

    :cond_33
    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder;->REMOTE_SET_TEXT:Lorg/dmfs/xmlobjects/ElementDescriptor;

    if-ne p3, v0, :cond_6

    iget-object v0, p4, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;->value:Ljava/lang/Object;

    instance-of v0, v0, Ljava/lang/CharSequence;

    if-eqz v0, :cond_6

    iget v1, p4, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;->viewId:I

    iget-object v0, p4, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;->value:Ljava/lang/Object;

    check-cast v0, Ljava/lang/CharSequence;

    invoke-virtual {p2, v1, v0}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    goto :goto_6
.end method

.method public update(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/widget/RemoteViews;Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/widget/RemoteViews;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Landroid/widget/RemoteViews;",
            ">;",
            "Landroid/widget/RemoteViews;",
            "Lorg/dmfs/xmlobjects/QualifiedName;",
            "Ljava/lang/String;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Landroid/widget/RemoteViews;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder;->ATTR_LAYOUT:Lorg/dmfs/xmlobjects/QualifiedName;

    if-ne p3, v0, :cond_1d

    new-instance p2, Landroid/widget/RemoteViews;

    move-object v0, p5

    check-cast v0, Lorg/dmfs/android/xmlmagic/AndroidParserContext;

    invoke-virtual {v0}, Lorg/dmfs/android/xmlmagic/AndroidParserContext;->getAppContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, p3, v1, p5}, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder;->getIntegerAttr(Lorg/dmfs/xmlobjects/QualifiedName;ZLorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-direct {p2, v0, v1}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    :cond_1d
    return-object p2
.end method

.method public bridge synthetic update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 12
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    move-object v2, p2

    check-cast v2, Landroid/widget/RemoteViews;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder;->update(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/widget/RemoteViews;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/widget/RemoteViews;

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

    check-cast v2, Landroid/widget/RemoteViews;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder;->update(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/widget/RemoteViews;Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/widget/RemoteViews;

    move-result-object v0

    return-object v0
.end method
