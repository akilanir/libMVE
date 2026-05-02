.class public Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;
.super Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Progress;,
        Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Lights;,
        Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Action;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder",
        "<",
        "Landroid/app/Notification;",
        ">;"
    }
.end annotation


# static fields
.field private static final ADD_ACTION:Lorg/dmfs/xmlobjects/ElementDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Landroid/support/v4/app/NotificationCompat$Action;",
            ">;"
        }
    .end annotation
.end field

.field private static final ATTR_ALERT_ONLY_ONCE:Lorg/dmfs/xmlobjects/QualifiedName;

.field private static final ATTR_AUTO_CANCEL:Lorg/dmfs/xmlobjects/QualifiedName;

.field private static final ATTR_COLOR:Lorg/dmfs/xmlobjects/QualifiedName;

.field private static final ATTR_CONTENT:Lorg/dmfs/xmlobjects/QualifiedName;

.field private static final ATTR_ICON:Lorg/dmfs/xmlobjects/QualifiedName;

.field private static final ATTR_INDETERMINANTE:Lorg/dmfs/xmlobjects/QualifiedName;

.field private static final ATTR_MAX:Lorg/dmfs/xmlobjects/QualifiedName;

.field private static final ATTR_NUMBER:Lorg/dmfs/xmlobjects/QualifiedName;

.field private static final ATTR_OFF_MS:Lorg/dmfs/xmlobjects/QualifiedName;

.field private static final ATTR_ONGOING:Lorg/dmfs/xmlobjects/QualifiedName;

.field private static final ATTR_ON_MS:Lorg/dmfs/xmlobjects/QualifiedName;

.field private static final ATTR_PROGRESS:Lorg/dmfs/xmlobjects/QualifiedName;

.field private static final ATTR_SHOW_WHEN:Lorg/dmfs/xmlobjects/QualifiedName;

.field private static final ATTR_SMALL_ICON:Lorg/dmfs/xmlobjects/QualifiedName;

.field private static final ATTR_SORT_KEY:Lorg/dmfs/xmlobjects/QualifiedName;

.field private static final ATTR_SOUND:Lorg/dmfs/xmlobjects/QualifiedName;

.field private static final ATTR_SUB_TEXT:Lorg/dmfs/xmlobjects/QualifiedName;

.field private static final ATTR_TICKER:Lorg/dmfs/xmlobjects/QualifiedName;

.field private static final ATTR_TITLE:Lorg/dmfs/xmlobjects/QualifiedName;

.field private static final ATTR_VISIBLE:Lorg/dmfs/xmlobjects/QualifiedName;

.field private static final CONTENT_ACTION:Lorg/dmfs/xmlobjects/ElementDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Landroid/app/PendingIntent;",
            ">;"
        }
    .end annotation
.end field

.field private static final DELETE_ACTION:Lorg/dmfs/xmlobjects/ElementDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Landroid/app/PendingIntent;",
            ">;"
        }
    .end annotation
.end field

.field public static final INSTANCE:Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;

.field private static final LIGHTS:Lorg/dmfs/xmlobjects/ElementDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Lights;",
            ">;"
        }
    .end annotation
.end field

.field private static final PROGRESS:Lorg/dmfs/xmlobjects/ElementDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Progress;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;

    invoke-direct {v0}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;-><init>()V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->INSTANCE:Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;

    const-string v0, "icon"

    invoke-static {v0}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_ICON:Lorg/dmfs/xmlobjects/QualifiedName;

    const-string v0, "ticker"

    invoke-static {v0}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_TICKER:Lorg/dmfs/xmlobjects/QualifiedName;

    const-string v0, "title"

    invoke-static {v0}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_TITLE:Lorg/dmfs/xmlobjects/QualifiedName;

    const-string v0, "sub-text"

    invoke-static {v0}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_SUB_TEXT:Lorg/dmfs/xmlobjects/QualifiedName;

    const-string v0, "ongoing"

    invoke-static {v0}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_ONGOING:Lorg/dmfs/xmlobjects/QualifiedName;

    const-string v0, "auto-cancel"

    invoke-static {v0}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_AUTO_CANCEL:Lorg/dmfs/xmlobjects/QualifiedName;

    const-string v0, "content"

    invoke-static {v0}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_CONTENT:Lorg/dmfs/xmlobjects/QualifiedName;

    const-string v0, "number"

    invoke-static {v0}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_NUMBER:Lorg/dmfs/xmlobjects/QualifiedName;

    const-string v0, "alert-only-once"

    invoke-static {v0}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_ALERT_ONLY_ONCE:Lorg/dmfs/xmlobjects/QualifiedName;

    const-string v0, "show-when"

    invoke-static {v0}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_SHOW_WHEN:Lorg/dmfs/xmlobjects/QualifiedName;

    const-string v0, "sort-key"

    invoke-static {v0}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_SORT_KEY:Lorg/dmfs/xmlobjects/QualifiedName;

    const-string v0, "color"

    invoke-static {v0}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_COLOR:Lorg/dmfs/xmlobjects/QualifiedName;

    const-string v0, "on-ms"

    invoke-static {v0}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_ON_MS:Lorg/dmfs/xmlobjects/QualifiedName;

    const-string v0, "off-ms"

    invoke-static {v0}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_OFF_MS:Lorg/dmfs/xmlobjects/QualifiedName;

    const-string v0, "sound"

    invoke-static {v0}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_SOUND:Lorg/dmfs/xmlobjects/QualifiedName;

    const-string v0, "max"

    invoke-static {v0}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_MAX:Lorg/dmfs/xmlobjects/QualifiedName;

    const-string v0, "progress"

    invoke-static {v0}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_PROGRESS:Lorg/dmfs/xmlobjects/QualifiedName;

    const-string v0, "visible"

    invoke-static {v0}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_VISIBLE:Lorg/dmfs/xmlobjects/QualifiedName;

    const-string v0, "indeterminante"

    invoke-static {v0}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_INDETERMINANTE:Lorg/dmfs/xmlobjects/QualifiedName;

    const-string v0, "small-icon"

    invoke-static {v0}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_SMALL_ICON:Lorg/dmfs/xmlobjects/QualifiedName;

    const-string v0, "http://dmfs.org/ns/android-xml-magic"

    const-string v1, "add-action"

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    new-instance v1, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$1;

    invoke-direct {v1}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$1;-><init>()V

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/ElementDescriptor;->register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ADD_ACTION:Lorg/dmfs/xmlobjects/ElementDescriptor;

    const-string v0, "http://dmfs.org/ns/android-xml-magic"

    const-string v1, "content-intent"

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder;->INSTANCE:Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder;

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/ElementDescriptor;->register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->CONTENT_ACTION:Lorg/dmfs/xmlobjects/ElementDescriptor;

    const-string v0, "http://dmfs.org/ns/android-xml-magic"

    const-string v1, "delete-intent"

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder;->INSTANCE:Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder;

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/ElementDescriptor;->register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->DELETE_ACTION:Lorg/dmfs/xmlobjects/ElementDescriptor;

    const-string v0, "http://dmfs.org/ns/android-xml-magic"

    const-string v1, "lights"

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    new-instance v1, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$2;

    invoke-direct {v1}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$2;-><init>()V

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/ElementDescriptor;->register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->LIGHTS:Lorg/dmfs/xmlobjects/ElementDescriptor;

    const-string v0, "http://dmfs.org/ns/android-xml-magic"

    const-string v1, "progress"

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    new-instance v1, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$3;

    invoke-direct {v1}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$3;-><init>()V

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/ElementDescriptor;->register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->PROGRESS:Lorg/dmfs/xmlobjects/ElementDescriptor;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder;-><init>()V

    return-void
.end method

.method static synthetic access$100()Lorg/dmfs/xmlobjects/QualifiedName;
    .registers 1

    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_ICON:Lorg/dmfs/xmlobjects/QualifiedName;

    return-object v0
.end method

.method static synthetic access$1000()Lorg/dmfs/xmlobjects/QualifiedName;
    .registers 1

    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_VISIBLE:Lorg/dmfs/xmlobjects/QualifiedName;

    return-object v0
.end method

.method static synthetic access$1100()Lorg/dmfs/xmlobjects/QualifiedName;
    .registers 1

    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_INDETERMINANTE:Lorg/dmfs/xmlobjects/QualifiedName;

    return-object v0
.end method

.method static synthetic access$200()Lorg/dmfs/xmlobjects/QualifiedName;
    .registers 1

    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_TITLE:Lorg/dmfs/xmlobjects/QualifiedName;

    return-object v0
.end method

.method static synthetic access$400()Lorg/dmfs/xmlobjects/QualifiedName;
    .registers 1

    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_COLOR:Lorg/dmfs/xmlobjects/QualifiedName;

    return-object v0
.end method

.method static synthetic access$500()Lorg/dmfs/xmlobjects/QualifiedName;
    .registers 1

    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_ON_MS:Lorg/dmfs/xmlobjects/QualifiedName;

    return-object v0
.end method

.method static synthetic access$600()Lorg/dmfs/xmlobjects/QualifiedName;
    .registers 1

    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_OFF_MS:Lorg/dmfs/xmlobjects/QualifiedName;

    return-object v0
.end method

.method static synthetic access$800()Lorg/dmfs/xmlobjects/QualifiedName;
    .registers 1

    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_MAX:Lorg/dmfs/xmlobjects/QualifiedName;

    return-object v0
.end method

.method static synthetic access$900()Lorg/dmfs/xmlobjects/QualifiedName;
    .registers 1

    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_PROGRESS:Lorg/dmfs/xmlobjects/QualifiedName;

    return-object v0
.end method

.method private getBuilder(Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 4

    invoke-virtual {p1}, Lorg/dmfs/xmlobjects/pull/ParserContext;->getState()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/app/NotificationCompat$Builder;

    if-nez v0, :cond_18

    new-instance v1, Landroid/support/v4/app/NotificationCompat$Builder;

    move-object v0, p1

    check-cast v0, Lorg/dmfs/android/xmlmagic/AndroidParserContext;

    invoke-virtual {v0}, Lorg/dmfs/android/xmlmagic/AndroidParserContext;->getAppContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {v1, v0}, Landroid/support/v4/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1, v1}, Lorg/dmfs/xmlobjects/pull/ParserContext;->setState(Ljava/lang/Object;)V

    move-object v0, v1

    :cond_18
    return-object v0
.end method


# virtual methods
.method public finish(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/app/Notification;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/app/Notification;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Landroid/app/Notification;",
            ">;",
            "Landroid/app/Notification;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Landroid/app/Notification;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    invoke-direct {p0, p3}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->getBuilder(Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

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

    check-cast p2, Landroid/app/Notification;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->finish(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/app/Notification;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/app/Notification;

    move-result-object v0

    return-object v0
.end method

.method public get(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/app/Notification;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/app/Notification;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Landroid/app/Notification;",
            ">;",
            "Landroid/app/Notification;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Landroid/app/Notification;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    instance-of v0, p3, Lorg/dmfs/android/xmlmagic/AndroidParserContext;

    if-nez v0, :cond_c

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "ParserContext must be an AndroidParserContext to build a Notification"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_c
    new-instance v1, Landroid/support/v4/app/NotificationCompat$Builder;

    move-object v0, p3

    check-cast v0, Lorg/dmfs/android/xmlmagic/AndroidParserContext;

    invoke-virtual {v0}, Lorg/dmfs/android/xmlmagic/AndroidParserContext;->getAppContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {v1, v0}, Landroid/support/v4/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p3, v1}, Lorg/dmfs/xmlobjects/pull/ParserContext;->setState(Ljava/lang/Object;)V

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

    check-cast p2, Landroid/app/Notification;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->get(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/app/Notification;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/app/Notification;

    move-result-object v0

    return-object v0
.end method

.method public update(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/app/Notification;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/app/Notification;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Landroid/app/Notification;",
            ">;",
            "Landroid/app/Notification;",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TV;>;TV;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Landroid/app/Notification;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    if-nez p4, :cond_3

    :cond_2
    :goto_2
    return-object p2

    :cond_3
    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ADD_ACTION:Lorg/dmfs/xmlobjects/ElementDescriptor;

    if-ne p3, v0, :cond_11

    invoke-direct {p0, p5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->getBuilder(Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    check-cast p4, Landroid/support/v4/app/NotificationCompat$Action;

    invoke-virtual {v0, p4}, Landroid/support/v4/app/NotificationCompat$Builder;->addAction(Landroid/support/v4/app/NotificationCompat$Action;)Landroid/support/v4/app/NotificationCompat$Builder;

    goto :goto_2

    :cond_11
    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->CONTENT_ACTION:Lorg/dmfs/xmlobjects/ElementDescriptor;

    if-ne p3, v0, :cond_1f

    invoke-direct {p0, p5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->getBuilder(Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    check-cast p4, Landroid/app/PendingIntent;

    invoke-virtual {v0, p4}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    goto :goto_2

    :cond_1f
    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->DELETE_ACTION:Lorg/dmfs/xmlobjects/ElementDescriptor;

    if-ne p3, v0, :cond_2d

    invoke-direct {p0, p5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->getBuilder(Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    check-cast p4, Landroid/app/PendingIntent;

    invoke-virtual {v0, p4}, Landroid/support/v4/app/NotificationCompat$Builder;->setDeleteIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    goto :goto_2

    :cond_2d
    sget-object v0, Lorg/dmfs/android/xmlmagic/Model;->REMOTE_VIEWS:Lorg/dmfs/xmlobjects/ElementDescriptor;

    if-ne p3, v0, :cond_3b

    invoke-direct {p0, p5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->getBuilder(Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    check-cast p4, Landroid/widget/RemoteViews;

    invoke-virtual {v0, p4}, Landroid/support/v4/app/NotificationCompat$Builder;->setContent(Landroid/widget/RemoteViews;)Landroid/support/v4/app/NotificationCompat$Builder;

    goto :goto_2

    :cond_3b
    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->LIGHTS:Lorg/dmfs/xmlobjects/ElementDescriptor;

    if-ne p3, v0, :cond_4f

    check-cast p4, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Lights;

    invoke-direct {p0, p5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->getBuilder(Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    iget v1, p4, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Lights;->color:I

    iget v2, p4, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Lights;->on:I

    iget v3, p4, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Lights;->off:I

    invoke-virtual {v0, v1, v2, v3}, Landroid/support/v4/app/NotificationCompat$Builder;->setLights(III)Landroid/support/v4/app/NotificationCompat$Builder;

    goto :goto_2

    :cond_4f
    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->PROGRESS:Lorg/dmfs/xmlobjects/ElementDescriptor;

    if-ne p3, v0, :cond_2

    check-cast p4, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Progress;

    iget-boolean v0, p4, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Progress;->visible:Z

    if-eqz v0, :cond_2

    invoke-direct {p0, p5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->getBuilder(Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    iget v1, p4, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Progress;->max:I

    iget v2, p4, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Progress;->progress:I

    iget-boolean v3, p4, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Progress;->indeterminante:Z

    invoke-virtual {v0, v1, v2, v3}, Landroid/support/v4/app/NotificationCompat$Builder;->setProgress(IIZ)Landroid/support/v4/app/NotificationCompat$Builder;

    goto :goto_2
.end method

.method public update(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/app/Notification;Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/app/Notification;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Landroid/app/Notification;",
            ">;",
            "Landroid/app/Notification;",
            "Lorg/dmfs/xmlobjects/QualifiedName;",
            "Ljava/lang/String;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Landroid/app/Notification;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_TICKER:Lorg/dmfs/xmlobjects/QualifiedName;

    if-ne p3, v0, :cond_10

    invoke-direct {p0, p5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->getBuilder(Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    invoke-virtual {p0, p3, p4, p5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->getCharSequenceAttr(Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    :cond_f
    :goto_f
    return-object p2

    :cond_10
    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_TITLE:Lorg/dmfs/xmlobjects/QualifiedName;

    if-ne p3, v0, :cond_20

    invoke-direct {p0, p5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->getBuilder(Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    invoke-virtual {p0, p3, p4, p5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->getCharSequenceAttr(Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    goto :goto_f

    :cond_20
    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_CONTENT:Lorg/dmfs/xmlobjects/QualifiedName;

    if-ne p3, v0, :cond_30

    invoke-direct {p0, p5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->getBuilder(Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    invoke-virtual {p0, p3, p4, p5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->getCharSequenceAttr(Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    goto :goto_f

    :cond_30
    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_SUB_TEXT:Lorg/dmfs/xmlobjects/QualifiedName;

    if-ne p3, v0, :cond_40

    invoke-direct {p0, p5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->getBuilder(Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    invoke-virtual {p0, p3, p4, p5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->getCharSequenceAttr(Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setSubText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    goto :goto_f

    :cond_40
    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_SMALL_ICON:Lorg/dmfs/xmlobjects/QualifiedName;

    if-ne p3, v0, :cond_55

    invoke-direct {p0, p5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->getBuilder(Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, p3, v1, p5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->getIntegerAttr(Lorg/dmfs/xmlobjects/QualifiedName;ZLorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setSmallIcon(I)Landroid/support/v4/app/NotificationCompat$Builder;

    goto :goto_f

    :cond_55
    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_ONGOING:Lorg/dmfs/xmlobjects/QualifiedName;

    if-ne p3, v0, :cond_65

    invoke-direct {p0, p5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->getBuilder(Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    invoke-virtual {p0, p3, p5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->getBooleanAttr(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/pull/ParserContext;)Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setOngoing(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    goto :goto_f

    :cond_65
    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_AUTO_CANCEL:Lorg/dmfs/xmlobjects/QualifiedName;

    if-ne p3, v0, :cond_75

    invoke-direct {p0, p5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->getBuilder(Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    invoke-virtual {p0, p3, p5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->getBooleanAttr(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/pull/ParserContext;)Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setAutoCancel(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    goto :goto_f

    :cond_75
    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_SHOW_WHEN:Lorg/dmfs/xmlobjects/QualifiedName;

    if-ne p3, v0, :cond_85

    invoke-direct {p0, p5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->getBuilder(Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    invoke-virtual {p0, p3, p5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->getBooleanAttr(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/pull/ParserContext;)Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setShowWhen(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    goto :goto_f

    :cond_85
    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_SORT_KEY:Lorg/dmfs/xmlobjects/QualifiedName;

    if-ne p3, v0, :cond_9a

    invoke-direct {p0, p5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->getBuilder(Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    invoke-virtual {p0, p3, p4, p5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->getCharSequenceAttr(Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setSortKey(Ljava/lang/String;)Landroid/support/v4/app/NotificationCompat$Builder;

    goto/16 :goto_f

    :cond_9a
    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_NUMBER:Lorg/dmfs/xmlobjects/QualifiedName;

    if-ne p3, v0, :cond_b0

    invoke-direct {p0, p5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->getBuilder(Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, p3, v1, p5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->getIntegerAttr(Lorg/dmfs/xmlobjects/QualifiedName;ZLorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setNumber(I)Landroid/support/v4/app/NotificationCompat$Builder;

    goto/16 :goto_f

    :cond_b0
    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_ALERT_ONLY_ONCE:Lorg/dmfs/xmlobjects/QualifiedName;

    if-ne p3, v0, :cond_c1

    invoke-direct {p0, p5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->getBuilder(Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    invoke-virtual {p0, p3, p5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->getBooleanAttr(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/pull/ParserContext;)Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setOnlyAlertOnce(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    goto/16 :goto_f

    :cond_c1
    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_SOUND:Lorg/dmfs/xmlobjects/QualifiedName;

    if-ne p3, v0, :cond_f

    invoke-direct {p0, p5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->getBuilder(Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    invoke-virtual {p0, p3, p4, p5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->getCharSequenceAttr(Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setSound(Landroid/net/Uri;)Landroid/support/v4/app/NotificationCompat$Builder;

    goto/16 :goto_f
.end method

.method public bridge synthetic update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    move-object v2, p2

    check-cast v2, Landroid/app/Notification;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->update(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/app/Notification;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/app/Notification;

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

    check-cast v2, Landroid/app/Notification;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->update(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/app/Notification;Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/app/Notification;

    move-result-object v0

    return-object v0
.end method
