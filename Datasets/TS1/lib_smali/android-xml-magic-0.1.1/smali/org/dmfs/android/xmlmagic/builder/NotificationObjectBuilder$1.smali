.class final Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$1;
.super Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder",
        "<",
        "Landroid/support/v4/app/NotificationCompat$Action;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder;-><init>()V

    return-void
.end method


# virtual methods
.method public finish(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/support/v4/app/NotificationCompat$Action;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/support/v4/app/NotificationCompat$Action;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Landroid/support/v4/app/NotificationCompat$Action;",
            ">;",
            "Landroid/support/v4/app/NotificationCompat$Action;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Landroid/support/v4/app/NotificationCompat$Action;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    invoke-virtual {p3}, Lorg/dmfs/xmlobjects/pull/ParserContext;->getState()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Action;

    iget-object v1, v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Action;->intent:Landroid/app/PendingIntent;

    if-nez v1, :cond_c

    const/4 v0, 0x0

    :goto_b
    return-object v0

    :cond_c
    new-instance v1, Landroid/support/v4/app/NotificationCompat$Action;

    iget v2, v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Action;->icon:I

    iget-object v3, v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Action;->title:Ljava/lang/CharSequence;

    iget-object v0, v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Action;->intent:Landroid/app/PendingIntent;

    invoke-direct {v1, v2, v3, v0}, Landroid/support/v4/app/NotificationCompat$Action;-><init>(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)V

    move-object v0, v1

    goto :goto_b
.end method

.method public bridge synthetic finish(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    check-cast p2, Landroid/support/v4/app/NotificationCompat$Action;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$1;->finish(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/support/v4/app/NotificationCompat$Action;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/support/v4/app/NotificationCompat$Action;

    move-result-object v0

    return-object v0
.end method

.method public get(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/support/v4/app/NotificationCompat$Action;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/support/v4/app/NotificationCompat$Action;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Landroid/support/v4/app/NotificationCompat$Action;",
            ">;",
            "Landroid/support/v4/app/NotificationCompat$Action;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Landroid/support/v4/app/NotificationCompat$Action;"
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

    const-string v1, "ParserContext must be an AndroidParserContext to build a Notification"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_d
    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Action;

    invoke-direct {v0, v1}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Action;-><init>(Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$1;)V

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

    check-cast p2, Landroid/support/v4/app/NotificationCompat$Action;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$1;->get(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/support/v4/app/NotificationCompat$Action;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/support/v4/app/NotificationCompat$Action;

    move-result-object v0

    return-object v0
.end method

.method public update(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/support/v4/app/NotificationCompat$Action;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/support/v4/app/NotificationCompat$Action;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Landroid/support/v4/app/NotificationCompat$Action;",
            ">;",
            "Landroid/support/v4/app/NotificationCompat$Action;",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TV;>;TV;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Landroid/support/v4/app/NotificationCompat$Action;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    sget-object v0, Lorg/dmfs/android/xmlmagic/Model;->PENDING_INTENT:Lorg/dmfs/xmlobjects/ElementDescriptor;

    if-ne p3, v0, :cond_e

    invoke-virtual {p5}, Lorg/dmfs/xmlobjects/pull/ParserContext;->getState()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Action;

    check-cast p4, Landroid/app/PendingIntent;

    iput-object p4, v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Action;->intent:Landroid/app/PendingIntent;

    :cond_e
    return-object p2
.end method

.method public update(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/support/v4/app/NotificationCompat$Action;Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/support/v4/app/NotificationCompat$Action;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Landroid/support/v4/app/NotificationCompat$Action;",
            ">;",
            "Landroid/support/v4/app/NotificationCompat$Action;",
            "Lorg/dmfs/xmlobjects/QualifiedName;",
            "Ljava/lang/String;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Landroid/support/v4/app/NotificationCompat$Action;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    # getter for: Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_ICON:Lorg/dmfs/xmlobjects/QualifiedName;
    invoke-static {}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->access$100()Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    if-ne v0, p3, :cond_18

    invoke-virtual {p5}, Lorg/dmfs/xmlobjects/pull/ParserContext;->getState()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Action;

    const/4 v1, 0x0

    invoke-virtual {p0, p3, v1, p5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$1;->getIntegerAttr(Lorg/dmfs/xmlobjects/QualifiedName;ZLorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iput v1, v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Action;->icon:I

    :cond_17
    :goto_17
    return-object p2

    :cond_18
    # getter for: Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_TITLE:Lorg/dmfs/xmlobjects/QualifiedName;
    invoke-static {}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->access$200()Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    if-ne v0, p3, :cond_17

    invoke-virtual {p5}, Lorg/dmfs/xmlobjects/pull/ParserContext;->getState()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Action;

    invoke-virtual {p0, p3, p4, p5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$1;->getCharSequenceAttr(Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/CharSequence;

    move-result-object v1

    iput-object v1, v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Action;->title:Ljava/lang/CharSequence;

    goto :goto_17
.end method

.method public bridge synthetic update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    move-object v2, p2

    check-cast v2, Landroid/support/v4/app/NotificationCompat$Action;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$1;->update(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/support/v4/app/NotificationCompat$Action;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/support/v4/app/NotificationCompat$Action;

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

    check-cast v2, Landroid/support/v4/app/NotificationCompat$Action;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$1;->update(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/support/v4/app/NotificationCompat$Action;Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/support/v4/app/NotificationCompat$Action;

    move-result-object v0

    return-object v0
.end method
