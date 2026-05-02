.class Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$PendingIntentDescriptor;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PendingIntentDescriptor"
.end annotation


# instance fields
.field flags:I

.field intent:Landroid/content/Intent;

.field intentType:Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$IntentType;

.field requestCode:I


# direct methods
.method private constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$PendingIntentDescriptor;->requestCode:I

    const/4 v0, 0x0

    iput v0, p0, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$PendingIntentDescriptor;->flags:I

    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$IntentType;->activity:Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$IntentType;

    iput-object v0, p0, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$PendingIntentDescriptor;->intentType:Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$IntentType;

    return-void
.end method

.method synthetic constructor <init>(Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$1;)V
    .registers 2

    invoke-direct {p0}, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$PendingIntentDescriptor;-><init>()V

    return-void
.end method
