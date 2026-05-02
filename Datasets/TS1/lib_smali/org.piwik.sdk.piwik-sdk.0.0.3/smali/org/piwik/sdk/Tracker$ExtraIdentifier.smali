.class public final enum Lorg/piwik/sdk/Tracker$ExtraIdentifier;
.super Ljava/lang/Enum;
.source "Tracker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/piwik/sdk/Tracker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ExtraIdentifier"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/piwik/sdk/Tracker$ExtraIdentifier;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/piwik/sdk/Tracker$ExtraIdentifier;

.field public static final enum APK_CHECKSUM:Lorg/piwik/sdk/Tracker$ExtraIdentifier;

.field public static final enum INSTALLER_PACKAGENAME:Lorg/piwik/sdk/Tracker$ExtraIdentifier;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 438
    new-instance v0, Lorg/piwik/sdk/Tracker$ExtraIdentifier;

    const-string v1, "APK_CHECKSUM"

    invoke-direct {v0, v1, v2}, Lorg/piwik/sdk/Tracker$ExtraIdentifier;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/piwik/sdk/Tracker$ExtraIdentifier;->APK_CHECKSUM:Lorg/piwik/sdk/Tracker$ExtraIdentifier;

    new-instance v0, Lorg/piwik/sdk/Tracker$ExtraIdentifier;

    const-string v1, "INSTALLER_PACKAGENAME"

    invoke-direct {v0, v1, v3}, Lorg/piwik/sdk/Tracker$ExtraIdentifier;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/piwik/sdk/Tracker$ExtraIdentifier;->INSTALLER_PACKAGENAME:Lorg/piwik/sdk/Tracker$ExtraIdentifier;

    .line 437
    const/4 v0, 0x2

    new-array v0, v0, [Lorg/piwik/sdk/Tracker$ExtraIdentifier;

    sget-object v1, Lorg/piwik/sdk/Tracker$ExtraIdentifier;->APK_CHECKSUM:Lorg/piwik/sdk/Tracker$ExtraIdentifier;

    aput-object v1, v0, v2

    sget-object v1, Lorg/piwik/sdk/Tracker$ExtraIdentifier;->INSTALLER_PACKAGENAME:Lorg/piwik/sdk/Tracker$ExtraIdentifier;

    aput-object v1, v0, v3

    sput-object v0, Lorg/piwik/sdk/Tracker$ExtraIdentifier;->$VALUES:[Lorg/piwik/sdk/Tracker$ExtraIdentifier;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 437
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/piwik/sdk/Tracker$ExtraIdentifier;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 437
    const-class v0, Lorg/piwik/sdk/Tracker$ExtraIdentifier;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/piwik/sdk/Tracker$ExtraIdentifier;

    return-object v0
.end method

.method public static values()[Lorg/piwik/sdk/Tracker$ExtraIdentifier;
    .registers 1

    .prologue
    .line 437
    sget-object v0, Lorg/piwik/sdk/Tracker$ExtraIdentifier;->$VALUES:[Lorg/piwik/sdk/Tracker$ExtraIdentifier;

    invoke-virtual {v0}, [Lorg/piwik/sdk/Tracker$ExtraIdentifier;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/piwik/sdk/Tracker$ExtraIdentifier;

    return-object v0
.end method
