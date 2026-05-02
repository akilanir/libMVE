.class public final enum Lcom/mikepenz/materialize/color/Material$Elements$Light;
.super Ljava/lang/Enum;
.source "Material.java"

# interfaces
.implements Lcom/mikepenz/materialize/color/IColor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/materialize/color/Material$Elements;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Light"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/mikepenz/materialize/color/Material$Elements$Light;",
        ">;",
        "Lcom/mikepenz/materialize/color/IColor;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/mikepenz/materialize/color/Material$Elements$Light;

.field public static final enum DISABLED_TEXT:Lcom/mikepenz/materialize/color/Material$Elements$Light;

.field public static final enum DIVIDER:Lcom/mikepenz/materialize/color/Material$Elements$Light;

.field public static final enum HINT_TEXT:Lcom/mikepenz/materialize/color/Material$Elements$Light;

.field public static final enum ICON:Lcom/mikepenz/materialize/color/Material$Elements$Light;

.field public static final enum SECONDARY_ICON:Lcom/mikepenz/materialize/color/Material$Elements$Light;

.field public static final enum SECONDARY_TEXT:Lcom/mikepenz/materialize/color/Material$Elements$Light;

.field public static final enum TEXT:Lcom/mikepenz/materialize/color/Material$Elements$Light;


# instance fields
.field color:Ljava/lang/String;

.field resource:I


# direct methods
.method static constructor <clinit>()V
    .registers 10

    .prologue
    const/4 v9, 0x4

    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 18
    new-instance v0, Lcom/mikepenz/materialize/color/Material$Elements$Light;

    const-string v1, "ICON"

    const-string v2, "#8A000000"

    sget v3, Lcom/mikepenz/materialize/R$color;->md_light_primary_icon:I

    invoke-direct {v0, v1, v5, v2, v3}, Lcom/mikepenz/materialize/color/Material$Elements$Light;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$Elements$Light;->ICON:Lcom/mikepenz/materialize/color/Material$Elements$Light;

    .line 19
    new-instance v0, Lcom/mikepenz/materialize/color/Material$Elements$Light;

    const-string v1, "TEXT"

    const-string v2, "#DE000000"

    sget v3, Lcom/mikepenz/materialize/R$color;->md_light_primary_text:I

    invoke-direct {v0, v1, v6, v2, v3}, Lcom/mikepenz/materialize/color/Material$Elements$Light;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$Elements$Light;->TEXT:Lcom/mikepenz/materialize/color/Material$Elements$Light;

    .line 20
    new-instance v0, Lcom/mikepenz/materialize/color/Material$Elements$Light;

    const-string v1, "SECONDARY_TEXT"

    const-string v2, "#8A000000"

    sget v3, Lcom/mikepenz/materialize/R$color;->md_light_secondary:I

    invoke-direct {v0, v1, v7, v2, v3}, Lcom/mikepenz/materialize/color/Material$Elements$Light;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$Elements$Light;->SECONDARY_TEXT:Lcom/mikepenz/materialize/color/Material$Elements$Light;

    .line 21
    new-instance v0, Lcom/mikepenz/materialize/color/Material$Elements$Light;

    const-string v1, "SECONDARY_ICON"

    const-string v2, "#8A000000"

    sget v3, Lcom/mikepenz/materialize/R$color;->md_light_secondary:I

    invoke-direct {v0, v1, v8, v2, v3}, Lcom/mikepenz/materialize/color/Material$Elements$Light;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$Elements$Light;->SECONDARY_ICON:Lcom/mikepenz/materialize/color/Material$Elements$Light;

    .line 22
    new-instance v0, Lcom/mikepenz/materialize/color/Material$Elements$Light;

    const-string v1, "DISABLED_TEXT"

    const-string v2, "#42000000"

    sget v3, Lcom/mikepenz/materialize/R$color;->md_light_disabled:I

    invoke-direct {v0, v1, v9, v2, v3}, Lcom/mikepenz/materialize/color/Material$Elements$Light;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$Elements$Light;->DISABLED_TEXT:Lcom/mikepenz/materialize/color/Material$Elements$Light;

    .line 23
    new-instance v0, Lcom/mikepenz/materialize/color/Material$Elements$Light;

    const-string v1, "HINT_TEXT"

    const/4 v2, 0x5

    const-string v3, "#42000000"

    sget v4, Lcom/mikepenz/materialize/R$color;->md_light_disabled:I

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/mikepenz/materialize/color/Material$Elements$Light;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$Elements$Light;->HINT_TEXT:Lcom/mikepenz/materialize/color/Material$Elements$Light;

    .line 24
    new-instance v0, Lcom/mikepenz/materialize/color/Material$Elements$Light;

    const-string v1, "DIVIDER"

    const/4 v2, 0x6

    const-string v3, "#1F000000"

    sget v4, Lcom/mikepenz/materialize/R$color;->md_light_dividers:I

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/mikepenz/materialize/color/Material$Elements$Light;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$Elements$Light;->DIVIDER:Lcom/mikepenz/materialize/color/Material$Elements$Light;

    .line 17
    const/4 v0, 0x7

    new-array v0, v0, [Lcom/mikepenz/materialize/color/Material$Elements$Light;

    sget-object v1, Lcom/mikepenz/materialize/color/Material$Elements$Light;->ICON:Lcom/mikepenz/materialize/color/Material$Elements$Light;

    aput-object v1, v0, v5

    sget-object v1, Lcom/mikepenz/materialize/color/Material$Elements$Light;->TEXT:Lcom/mikepenz/materialize/color/Material$Elements$Light;

    aput-object v1, v0, v6

    sget-object v1, Lcom/mikepenz/materialize/color/Material$Elements$Light;->SECONDARY_TEXT:Lcom/mikepenz/materialize/color/Material$Elements$Light;

    aput-object v1, v0, v7

    sget-object v1, Lcom/mikepenz/materialize/color/Material$Elements$Light;->SECONDARY_ICON:Lcom/mikepenz/materialize/color/Material$Elements$Light;

    aput-object v1, v0, v8

    sget-object v1, Lcom/mikepenz/materialize/color/Material$Elements$Light;->DISABLED_TEXT:Lcom/mikepenz/materialize/color/Material$Elements$Light;

    aput-object v1, v0, v9

    const/4 v1, 0x5

    sget-object v2, Lcom/mikepenz/materialize/color/Material$Elements$Light;->HINT_TEXT:Lcom/mikepenz/materialize/color/Material$Elements$Light;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/mikepenz/materialize/color/Material$Elements$Light;->DIVIDER:Lcom/mikepenz/materialize/color/Material$Elements$Light;

    aput-object v2, v0, v1

    sput-object v0, Lcom/mikepenz/materialize/color/Material$Elements$Light;->$VALUES:[Lcom/mikepenz/materialize/color/Material$Elements$Light;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;I)V
    .registers 5
    .param p3, "color"    # Ljava/lang/String;
    .param p4, "resource"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 29
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 30
    iput-object p3, p0, Lcom/mikepenz/materialize/color/Material$Elements$Light;->color:Ljava/lang/String;

    .line 31
    iput p4, p0, Lcom/mikepenz/materialize/color/Material$Elements$Light;->resource:I

    .line 32
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/mikepenz/materialize/color/Material$Elements$Light;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 17
    const-class v0, Lcom/mikepenz/materialize/color/Material$Elements$Light;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/materialize/color/Material$Elements$Light;

    return-object v0
.end method

.method public static values()[Lcom/mikepenz/materialize/color/Material$Elements$Light;
    .registers 1

    .prologue
    .line 17
    sget-object v0, Lcom/mikepenz/materialize/color/Material$Elements$Light;->$VALUES:[Lcom/mikepenz/materialize/color/Material$Elements$Light;

    invoke-virtual {v0}, [Lcom/mikepenz/materialize/color/Material$Elements$Light;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/mikepenz/materialize/color/Material$Elements$Light;

    return-object v0
.end method


# virtual methods
.method public getAsColor()I
    .registers 2

    .prologue
    .line 41
    iget-object v0, p0, Lcom/mikepenz/materialize/color/Material$Elements$Light;->color:Ljava/lang/String;

    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getAsResource()I
    .registers 2

    .prologue
    .line 46
    iget v0, p0, Lcom/mikepenz/materialize/color/Material$Elements$Light;->resource:I

    return v0
.end method

.method public getAsString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 36
    iget-object v0, p0, Lcom/mikepenz/materialize/color/Material$Elements$Light;->color:Ljava/lang/String;

    return-object v0
.end method
