.class public Lorg/dmfs/android/xmlmagic/XmlLoader;
.super Ljava/lang/Object;


# static fields
.field private static final EMPTY_PATH:Lorg/dmfs/xmlobjects/pull/XmlPath;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lorg/dmfs/xmlobjects/pull/XmlPath;

    const/4 v1, 0x0

    new-array v1, v1, [Lorg/dmfs/xmlobjects/ElementDescriptor;

    invoke-direct {v0, v1}, Lorg/dmfs/xmlobjects/pull/XmlPath;-><init>([Lorg/dmfs/xmlobjects/ElementDescriptor;)V

    sput-object v0, Lorg/dmfs/android/xmlmagic/XmlLoader;->EMPTY_PATH:Lorg/dmfs/xmlobjects/pull/XmlPath;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static varargs getParser(Landroid/content/Context;I[Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;)Lorg/dmfs/xmlobjects/pull/XmlObjectPull;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;,
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object v1

    new-instance v2, Lorg/dmfs/xmlobjects/pull/XmlObjectPull;

    if-eqz p2, :cond_21

    array-length v0, p2

    if-lez v0, :cond_21

    new-instance v0, Lorg/dmfs/android/xmlmagic/AndroidParserContext;

    new-instance v3, Lorg/dmfs/android/xmlmagic/tokenresolvers/AndroidTokenResolver;

    invoke-direct {v3, p0}, Lorg/dmfs/android/xmlmagic/tokenresolvers/AndroidTokenResolver;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, p2}, Lorg/dmfs/android/xmlmagic/tokenresolvers/AndroidTokenResolver;->setResolvers([Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;)Lorg/dmfs/android/xmlmagic/tokenresolvers/AndroidTokenResolver;

    move-result-object v3

    invoke-direct {v0, p0, v3}, Lorg/dmfs/android/xmlmagic/AndroidParserContext;-><init>(Landroid/content/Context;Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;)V

    :goto_1d
    invoke-direct {v2, v1, v0}, Lorg/dmfs/xmlobjects/pull/XmlObjectPull;-><init>(Lorg/xmlpull/v1/XmlPullParser;Lorg/dmfs/xmlobjects/pull/ParserContext;)V

    return-object v2

    :cond_21
    new-instance v0, Lorg/dmfs/android/xmlmagic/AndroidParserContext;

    const/4 v3, 0x0

    invoke-direct {v0, p0, v3}, Lorg/dmfs/android/xmlmagic/AndroidParserContext;-><init>(Landroid/content/Context;Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;)V

    goto :goto_1d
.end method

.method public static varargs loadBundle(Landroid/content/Context;I[Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;)Landroid/os/Bundle;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;,
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    invoke-static {p0, p1, p2}, Lorg/dmfs/android/xmlmagic/XmlLoader;->getParser(Landroid/content/Context;I[Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;)Lorg/dmfs/xmlobjects/pull/XmlObjectPull;

    move-result-object v0

    sget-object v1, Lorg/dmfs/android/xmlmagic/Model;->BUNDLE:Lorg/dmfs/xmlobjects/ElementDescriptor;

    const/4 v2, 0x0

    sget-object v3, Lorg/dmfs/android/xmlmagic/XmlLoader;->EMPTY_PATH:Lorg/dmfs/xmlobjects/pull/XmlPath;

    invoke-virtual {v0, v1, v2, v3}, Lorg/dmfs/xmlobjects/pull/XmlObjectPull;->pull(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/XmlPath;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Bundle;

    return-object v0
.end method

.method public static varargs loadIntent(Landroid/content/Context;I[Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;)Landroid/content/Intent;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;,
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    invoke-static {p0, p1, p2}, Lorg/dmfs/android/xmlmagic/XmlLoader;->getParser(Landroid/content/Context;I[Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;)Lorg/dmfs/xmlobjects/pull/XmlObjectPull;

    move-result-object v0

    sget-object v1, Lorg/dmfs/android/xmlmagic/Model;->INTENT:Lorg/dmfs/xmlobjects/ElementDescriptor;

    const/4 v2, 0x0

    sget-object v3, Lorg/dmfs/android/xmlmagic/XmlLoader;->EMPTY_PATH:Lorg/dmfs/xmlobjects/pull/XmlPath;

    invoke-virtual {v0, v1, v2, v3}, Lorg/dmfs/xmlobjects/pull/XmlObjectPull;->pull(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/XmlPath;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Intent;

    return-object v0
.end method

.method public static varargs loadNotification(Landroid/content/Context;I[Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;)Landroid/app/Notification;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;,
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    invoke-static {p0, p1, p2}, Lorg/dmfs/android/xmlmagic/XmlLoader;->getParser(Landroid/content/Context;I[Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;)Lorg/dmfs/xmlobjects/pull/XmlObjectPull;

    move-result-object v0

    sget-object v1, Lorg/dmfs/android/xmlmagic/Model;->NOTIFICATION:Lorg/dmfs/xmlobjects/ElementDescriptor;

    const/4 v2, 0x0

    sget-object v3, Lorg/dmfs/android/xmlmagic/XmlLoader;->EMPTY_PATH:Lorg/dmfs/xmlobjects/pull/XmlPath;

    invoke-virtual {v0, v1, v2, v3}, Lorg/dmfs/xmlobjects/pull/XmlObjectPull;->pull(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/XmlPath;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Notification;

    return-object v0
.end method

.method public static populate(Landroid/app/Activity;)V
    .registers 4

    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p0}, Landroid/app/Activity;->getComponentName()Landroid/content/ComponentName;

    move-result-object v1

    const/16 v2, 0x81

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;

    move-result-object v0

    iget-object v0, v0, Landroid/content/pm/ActivityInfo;->metaData:Landroid/os/Bundle;

    const-string v1, "org.dmfs.ACTIVITY_PARAMETERS"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_1b

    invoke-static {p0, v0}, Lorg/dmfs/android/xmlmagic/XmlLoader;->populate(Landroid/app/Activity;I)V
    :try_end_1b
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_1b} :catch_1c

    :cond_1b
    :goto_1b
    return-void

    :catch_1c
    move-exception v0

    goto :goto_1b
.end method

.method public static populate(Landroid/app/Activity;I)V
    .registers 3

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/dmfs/android/xmlmagic/XmlLoader;->populate(Landroid/app/Activity;ILorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;)V

    return-void
.end method

.method public static populate(Landroid/app/Activity;ILorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;)V
    .registers 7

    new-instance v0, Lorg/dmfs/xmlobjects/XmlContext;

    invoke-direct {v0}, Lorg/dmfs/xmlobjects/XmlContext;-><init>()V

    const-string v1, "http://dmfs.org/ns/android-xml-magic"

    const-string v2, "activity"

    invoke-static {v1, v2}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v1

    new-instance v2, Lorg/dmfs/android/xmlmagic/builder/RecyclingReflectionObjectBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/dmfs/android/xmlmagic/builder/RecyclingReflectionObjectBuilder;-><init>(Ljava/lang/Class;)V

    invoke-static {v1, v2, v0}, Lorg/dmfs/xmlobjects/ElementDescriptor;->register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;Lorg/dmfs/xmlobjects/XmlContext;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v1

    const/4 v2, 0x1

    :try_start_1b
    new-array v2, v2, [Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;

    const/4 v3, 0x0

    aput-object p2, v2, v3

    invoke-static {p0, p1, v2}, Lorg/dmfs/android/xmlmagic/XmlLoader;->getParser(Landroid/content/Context;I[Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;)Lorg/dmfs/xmlobjects/pull/XmlObjectPull;

    move-result-object v2

    invoke-virtual {v2, v0}, Lorg/dmfs/xmlobjects/pull/XmlObjectPull;->setContext(Lorg/dmfs/xmlobjects/XmlContext;)V

    sget-object v0, Lorg/dmfs/android/xmlmagic/XmlLoader;->EMPTY_PATH:Lorg/dmfs/xmlobjects/pull/XmlPath;

    invoke-virtual {v2, v1, p0, v0}, Lorg/dmfs/xmlobjects/pull/XmlObjectPull;->pull(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/XmlPath;)Ljava/lang/Object;
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_2c} :catch_2d

    return-void

    :catch_2d
    move-exception v0

    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "could not populate activity"

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static populate(Landroid/app/Activity;Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;)V
    .registers 5

    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p0}, Landroid/app/Activity;->getComponentName()Landroid/content/ComponentName;

    move-result-object v1

    const/16 v2, 0x81

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;

    move-result-object v0

    iget-object v0, v0, Landroid/content/pm/ActivityInfo;->metaData:Landroid/os/Bundle;

    const-string v1, "org.dmfs.ACTIVITY_PARAMETERS"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_1b

    invoke-static {p0, v0, p1}, Lorg/dmfs/android/xmlmagic/XmlLoader;->populate(Landroid/app/Activity;ILorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;)V
    :try_end_1b
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_1b} :catch_1c

    :cond_1b
    :goto_1b
    return-void

    :catch_1c
    move-exception v0

    goto :goto_1b
.end method

.method public static populate(Landroid/app/Service;)V
    .registers 4

    :try_start_0
    invoke-virtual {p0}, Landroid/app/Service;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    new-instance v1, Landroid/content/ComponentName;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/16 v2, 0x84

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getServiceInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ServiceInfo;

    move-result-object v0

    iget-object v0, v0, Landroid/content/pm/ServiceInfo;->metaData:Landroid/os/Bundle;

    const-string v1, "org.dmfs.SERVICE_PARAMETERS"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_20

    invoke-static {p0, v0}, Lorg/dmfs/android/xmlmagic/XmlLoader;->populate(Landroid/app/Service;I)V
    :try_end_20
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_20} :catch_21

    :cond_20
    :goto_20
    return-void

    :catch_21
    move-exception v0

    goto :goto_20
.end method

.method public static populate(Landroid/app/Service;I)V
    .registers 3

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/dmfs/android/xmlmagic/XmlLoader;->populate(Landroid/app/Service;ILorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;)V

    return-void
.end method

.method public static populate(Landroid/app/Service;ILorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;)V
    .registers 7

    new-instance v0, Lorg/dmfs/xmlobjects/XmlContext;

    invoke-direct {v0}, Lorg/dmfs/xmlobjects/XmlContext;-><init>()V

    const-string v1, "http://dmfs.org/ns/android-xml-magic"

    const-string v2, "service"

    invoke-static {v1, v2}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v1

    new-instance v2, Lorg/dmfs/android/xmlmagic/builder/RecyclingReflectionObjectBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/dmfs/android/xmlmagic/builder/RecyclingReflectionObjectBuilder;-><init>(Ljava/lang/Class;)V

    invoke-static {v1, v2, v0}, Lorg/dmfs/xmlobjects/ElementDescriptor;->register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;Lorg/dmfs/xmlobjects/XmlContext;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v1

    const/4 v2, 0x1

    :try_start_1b
    new-array v2, v2, [Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;

    const/4 v3, 0x0

    aput-object p2, v2, v3

    invoke-static {p0, p1, v2}, Lorg/dmfs/android/xmlmagic/XmlLoader;->getParser(Landroid/content/Context;I[Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;)Lorg/dmfs/xmlobjects/pull/XmlObjectPull;

    move-result-object v2

    invoke-virtual {v2, v0}, Lorg/dmfs/xmlobjects/pull/XmlObjectPull;->setContext(Lorg/dmfs/xmlobjects/XmlContext;)V

    sget-object v0, Lorg/dmfs/android/xmlmagic/XmlLoader;->EMPTY_PATH:Lorg/dmfs/xmlobjects/pull/XmlPath;

    invoke-virtual {v2, v1, p0, v0}, Lorg/dmfs/xmlobjects/pull/XmlObjectPull;->pull(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/XmlPath;)Ljava/lang/Object;
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_2c} :catch_2d

    return-void

    :catch_2d
    move-exception v0

    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "could not populate service"

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static populate(Landroid/app/Service;Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;)V
    .registers 5

    :try_start_0
    invoke-virtual {p0}, Landroid/app/Service;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    new-instance v1, Landroid/content/ComponentName;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/16 v2, 0x84

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getServiceInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ServiceInfo;

    move-result-object v0

    iget-object v0, v0, Landroid/content/pm/ServiceInfo;->metaData:Landroid/os/Bundle;

    const-string v1, "org.dmfs.SERVICE_PARAMETERS"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_20

    invoke-static {p0, v0, p1}, Lorg/dmfs/android/xmlmagic/XmlLoader;->populate(Landroid/app/Service;ILorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;)V
    :try_end_20
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_20} :catch_21

    :cond_20
    :goto_20
    return-void

    :catch_21
    move-exception v0

    goto :goto_20
.end method
