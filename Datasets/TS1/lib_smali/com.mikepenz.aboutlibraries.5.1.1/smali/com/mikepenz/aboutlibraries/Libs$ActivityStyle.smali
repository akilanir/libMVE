.class public final enum Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;
.super Ljava/lang/Enum;
.source "Libs.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/aboutlibraries/Libs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ActivityStyle"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

.field public static final enum DARK:Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

.field public static final enum LIGHT:Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

.field public static final enum LIGHT_DARK_TOOLBAR:Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 39
    new-instance v0, Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

    const-string v1, "LIGHT"

    invoke-direct {v0, v1, v2}, Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;->LIGHT:Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

    .line 40
    new-instance v0, Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

    const-string v1, "DARK"

    invoke-direct {v0, v1, v3}, Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;->DARK:Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

    .line 41
    new-instance v0, Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

    const-string v1, "LIGHT_DARK_TOOLBAR"

    invoke-direct {v0, v1, v4}, Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;->LIGHT_DARK_TOOLBAR:Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

    .line 38
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

    sget-object v1, Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;->LIGHT:Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

    aput-object v1, v0, v2

    sget-object v1, Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;->DARK:Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

    aput-object v1, v0, v3

    sget-object v1, Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;->LIGHT_DARK_TOOLBAR:Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

    aput-object v1, v0, v4

    sput-object v0, Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;->$VALUES:[Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

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
    .line 38
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 38
    const-class v0, Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

    return-object v0
.end method

.method public static values()[Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;
    .registers 1

    .prologue
    .line 38
    sget-object v0, Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;->$VALUES:[Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

    invoke-virtual {v0}, [Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/mikepenz/aboutlibraries/Libs$ActivityStyle;

    return-object v0
.end method
