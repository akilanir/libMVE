.class public Lorg/dmfs/android/xmlmagic/Model;
.super Ljava/lang/Object;


# static fields
.field public static final AND:Lorg/dmfs/xmlobjects/ElementDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final ATTR_KEY:Lorg/dmfs/xmlobjects/QualifiedName;

.field public static final BOOLEAN:Lorg/dmfs/xmlobjects/ElementDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final BUNDLE:Lorg/dmfs/xmlobjects/ElementDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Landroid/os/Bundle;",
            ">;"
        }
    .end annotation
.end field

.field public static final CHAR_SEQUENCE:Lorg/dmfs/xmlobjects/ElementDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Ljava/lang/CharSequence;",
            ">;"
        }
    .end annotation
.end field

.field public static final EQUALS:Lorg/dmfs/xmlobjects/ElementDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final INTENT:Lorg/dmfs/xmlobjects/ElementDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation
.end field

.field public static final NAMESPACE:Ljava/lang/String; = "http://dmfs.org/ns/android-xml-magic"

.field public static final NOTIFICATION:Lorg/dmfs/xmlobjects/ElementDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Landroid/app/Notification;",
            ">;"
        }
    .end annotation
.end field

.field public static final OR:Lorg/dmfs/xmlobjects/ElementDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final PENDING_INTENT:Lorg/dmfs/xmlobjects/ElementDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Landroid/app/PendingIntent;",
            ">;"
        }
    .end annotation
.end field

.field public static final REMOTE_VIEWS:Lorg/dmfs/xmlobjects/ElementDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Landroid/widget/RemoteViews;",
            ">;"
        }
    .end annotation
.end field

.field public static final STRING:Lorg/dmfs/xmlobjects/ElementDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final URI:Lorg/dmfs/xmlobjects/ElementDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field

.field public static final XOR:Lorg/dmfs/xmlobjects/ElementDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 3

    const-string v0, "key"

    invoke-static {v0}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/Model;->ATTR_KEY:Lorg/dmfs/xmlobjects/QualifiedName;

    const-string v0, "http://dmfs.org/ns/android-xml-magic"

    const-string v1, "and"

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    new-instance v1, Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder;

    sget-object v2, Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;->and:Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;

    invoke-direct {v1, v2}, Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder;-><init>(Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;)V

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/ElementDescriptor;->register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/Model;->AND:Lorg/dmfs/xmlobjects/ElementDescriptor;

    const-string v0, "http://dmfs.org/ns/android-xml-magic"

    const-string v1, "boolean"

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/AndroidBooleanObjectBuilder;->INSTANCE:Lorg/dmfs/android/xmlmagic/builder/AndroidBooleanObjectBuilder;

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/ElementDescriptor;->register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/Model;->BOOLEAN:Lorg/dmfs/xmlobjects/ElementDescriptor;

    const-string v0, "http://dmfs.org/ns/android-xml-magic"

    const-string v1, "bundle"

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder;->INSTANCE:Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder;

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/ElementDescriptor;->register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/Model;->BUNDLE:Lorg/dmfs/xmlobjects/ElementDescriptor;

    const-string v0, "http://dmfs.org/ns/android-xml-magic"

    const-string v1, "charsequence"

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/AndroidCharSequenceObjectBuilder;->INSTANCE:Lorg/dmfs/android/xmlmagic/builder/AndroidCharSequenceObjectBuilder;

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/ElementDescriptor;->register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/Model;->CHAR_SEQUENCE:Lorg/dmfs/xmlobjects/ElementDescriptor;

    const-string v0, "http://dmfs.org/ns/android-xml-magic"

    const-string v1, "equals"

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    new-instance v1, Lorg/dmfs/android/xmlmagic/builder/EqualsObjectBuilder;

    invoke-direct {v1}, Lorg/dmfs/android/xmlmagic/builder/EqualsObjectBuilder;-><init>()V

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/ElementDescriptor;->register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/Model;->EQUALS:Lorg/dmfs/xmlobjects/ElementDescriptor;

    const-string v0, "http://dmfs.org/ns/android-xml-magic"

    const-string v1, "intent"

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder;->INSTANCE:Lorg/dmfs/android/xmlmagic/builder/IntentObjectBuilder;

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/ElementDescriptor;->register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/Model;->INTENT:Lorg/dmfs/xmlobjects/ElementDescriptor;

    const-string v0, "http://dmfs.org/ns/android-xml-magic"

    const-string v1, "notification"

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->INSTANCE:Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/ElementDescriptor;->register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/Model;->NOTIFICATION:Lorg/dmfs/xmlobjects/ElementDescriptor;

    const-string v0, "http://dmfs.org/ns/android-xml-magic"

    const-string v1, "or"

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    new-instance v1, Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder;

    sget-object v2, Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;->or:Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;

    invoke-direct {v1, v2}, Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder;-><init>(Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;)V

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/ElementDescriptor;->register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/Model;->OR:Lorg/dmfs/xmlobjects/ElementDescriptor;

    const-string v0, "http://dmfs.org/ns/android-xml-magic"

    const-string v1, "pending-intent"

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder;->INSTANCE:Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder;

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/ElementDescriptor;->register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/Model;->PENDING_INTENT:Lorg/dmfs/xmlobjects/ElementDescriptor;

    const-string v0, "http://dmfs.org/ns/android-xml-magic"

    const-string v1, "remote-views"

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder;->INSTANCE:Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder;

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/ElementDescriptor;->register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/Model;->REMOTE_VIEWS:Lorg/dmfs/xmlobjects/ElementDescriptor;

    const-string v0, "http://dmfs.org/ns/android-xml-magic"

    const-string v1, "string"

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/AndroidStringObjectBuilder;->INSTANCE:Lorg/dmfs/android/xmlmagic/builder/AndroidStringObjectBuilder;

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/ElementDescriptor;->register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/Model;->STRING:Lorg/dmfs/xmlobjects/ElementDescriptor;

    const-string v0, "http://dmfs.org/ns/android-xml-magic"

    const-string v1, "uri"

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->INSTANCE:Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/ElementDescriptor;->register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/Model;->URI:Lorg/dmfs/xmlobjects/ElementDescriptor;

    const-string v0, "http://dmfs.org/ns/android-xml-magic"

    const-string v1, "xor"

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    new-instance v1, Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder;

    sget-object v2, Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;->xor:Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;

    invoke-direct {v1, v2}, Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder;-><init>(Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;)V

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/ElementDescriptor;->register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/Model;->XOR:Lorg/dmfs/xmlobjects/ElementDescriptor;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
