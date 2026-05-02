.class public final enum Lcom/mikepenz/materialize/color/Material$Red;
.super Ljava/lang/Enum;
.source "Material.java"

# interfaces
.implements Lcom/mikepenz/materialize/color/IColor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/materialize/color/Material;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Red"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/mikepenz/materialize/color/Material$Red;",
        ">;",
        "Lcom/mikepenz/materialize/color/IColor;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/mikepenz/materialize/color/Material$Red;

.field public static final enum _100:Lcom/mikepenz/materialize/color/Material$Red;

.field public static final enum _200:Lcom/mikepenz/materialize/color/Material$Red;

.field public static final enum _300:Lcom/mikepenz/materialize/color/Material$Red;

.field public static final enum _400:Lcom/mikepenz/materialize/color/Material$Red;

.field public static final enum _50:Lcom/mikepenz/materialize/color/Material$Red;

.field public static final enum _500:Lcom/mikepenz/materialize/color/Material$Red;

.field public static final enum _600:Lcom/mikepenz/materialize/color/Material$Red;

.field public static final enum _700:Lcom/mikepenz/materialize/color/Material$Red;

.field public static final enum _800:Lcom/mikepenz/materialize/color/Material$Red;

.field public static final enum _900:Lcom/mikepenz/materialize/color/Material$Red;

.field public static final enum _A100:Lcom/mikepenz/materialize/color/Material$Red;

.field public static final enum _A200:Lcom/mikepenz/materialize/color/Material$Red;

.field public static final enum _A400:Lcom/mikepenz/materialize/color/Material$Red;

.field public static final enum _A700:Lcom/mikepenz/materialize/color/Material$Red;


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

    .line 89
    new-instance v0, Lcom/mikepenz/materialize/color/Material$Red;

    const-string v1, "_50"

    const-string v2, "#FFEBEE"

    sget v3, Lcom/mikepenz/materialize/R$color;->md_red_50:I

    invoke-direct {v0, v1, v5, v2, v3}, Lcom/mikepenz/materialize/color/Material$Red;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$Red;->_50:Lcom/mikepenz/materialize/color/Material$Red;

    .line 90
    new-instance v0, Lcom/mikepenz/materialize/color/Material$Red;

    const-string v1, "_100"

    const-string v2, "#FFCDD2"

    sget v3, Lcom/mikepenz/materialize/R$color;->md_red_100:I

    invoke-direct {v0, v1, v6, v2, v3}, Lcom/mikepenz/materialize/color/Material$Red;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$Red;->_100:Lcom/mikepenz/materialize/color/Material$Red;

    .line 91
    new-instance v0, Lcom/mikepenz/materialize/color/Material$Red;

    const-string v1, "_200"

    const-string v2, "#EF9A9A"

    sget v3, Lcom/mikepenz/materialize/R$color;->md_red_200:I

    invoke-direct {v0, v1, v7, v2, v3}, Lcom/mikepenz/materialize/color/Material$Red;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$Red;->_200:Lcom/mikepenz/materialize/color/Material$Red;

    .line 92
    new-instance v0, Lcom/mikepenz/materialize/color/Material$Red;

    const-string v1, "_300"

    const-string v2, "#E57373"

    sget v3, Lcom/mikepenz/materialize/R$color;->md_red_300:I

    invoke-direct {v0, v1, v8, v2, v3}, Lcom/mikepenz/materialize/color/Material$Red;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$Red;->_300:Lcom/mikepenz/materialize/color/Material$Red;

    .line 93
    new-instance v0, Lcom/mikepenz/materialize/color/Material$Red;

    const-string v1, "_400"

    const-string v2, "#EF5350"

    sget v3, Lcom/mikepenz/materialize/R$color;->md_red_400:I

    invoke-direct {v0, v1, v9, v2, v3}, Lcom/mikepenz/materialize/color/Material$Red;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$Red;->_400:Lcom/mikepenz/materialize/color/Material$Red;

    .line 94
    new-instance v0, Lcom/mikepenz/materialize/color/Material$Red;

    const-string v1, "_500"

    const/4 v2, 0x5

    const-string v3, "#F44336"

    sget v4, Lcom/mikepenz/materialize/R$color;->md_red_500:I

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/mikepenz/materialize/color/Material$Red;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$Red;->_500:Lcom/mikepenz/materialize/color/Material$Red;

    .line 95
    new-instance v0, Lcom/mikepenz/materialize/color/Material$Red;

    const-string v1, "_600"

    const/4 v2, 0x6

    const-string v3, "#E53935"

    sget v4, Lcom/mikepenz/materialize/R$color;->md_red_600:I

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/mikepenz/materialize/color/Material$Red;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$Red;->_600:Lcom/mikepenz/materialize/color/Material$Red;

    .line 96
    new-instance v0, Lcom/mikepenz/materialize/color/Material$Red;

    const-string v1, "_700"

    const/4 v2, 0x7

    const-string v3, "#D32F2F"

    sget v4, Lcom/mikepenz/materialize/R$color;->md_red_700:I

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/mikepenz/materialize/color/Material$Red;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$Red;->_700:Lcom/mikepenz/materialize/color/Material$Red;

    .line 97
    new-instance v0, Lcom/mikepenz/materialize/color/Material$Red;

    const-string v1, "_800"

    const/16 v2, 0x8

    const-string v3, "#C62828"

    sget v4, Lcom/mikepenz/materialize/R$color;->md_red_800:I

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/mikepenz/materialize/color/Material$Red;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$Red;->_800:Lcom/mikepenz/materialize/color/Material$Red;

    .line 98
    new-instance v0, Lcom/mikepenz/materialize/color/Material$Red;

    const-string v1, "_900"

    const/16 v2, 0x9

    const-string v3, "#B71C1C"

    sget v4, Lcom/mikepenz/materialize/R$color;->md_red_900:I

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/mikepenz/materialize/color/Material$Red;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$Red;->_900:Lcom/mikepenz/materialize/color/Material$Red;

    .line 99
    new-instance v0, Lcom/mikepenz/materialize/color/Material$Red;

    const-string v1, "_A100"

    const/16 v2, 0xa

    const-string v3, "#FF8A80"

    sget v4, Lcom/mikepenz/materialize/R$color;->md_red_A100:I

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/mikepenz/materialize/color/Material$Red;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$Red;->_A100:Lcom/mikepenz/materialize/color/Material$Red;

    .line 100
    new-instance v0, Lcom/mikepenz/materialize/color/Material$Red;

    const-string v1, "_A200"

    const/16 v2, 0xb

    const-string v3, "#FF5252"

    sget v4, Lcom/mikepenz/materialize/R$color;->md_red_A200:I

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/mikepenz/materialize/color/Material$Red;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$Red;->_A200:Lcom/mikepenz/materialize/color/Material$Red;

    .line 101
    new-instance v0, Lcom/mikepenz/materialize/color/Material$Red;

    const-string v1, "_A400"

    const/16 v2, 0xc

    const-string v3, "#FF1744"

    sget v4, Lcom/mikepenz/materialize/R$color;->md_red_A400:I

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/mikepenz/materialize/color/Material$Red;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$Red;->_A400:Lcom/mikepenz/materialize/color/Material$Red;

    .line 102
    new-instance v0, Lcom/mikepenz/materialize/color/Material$Red;

    const-string v1, "_A700"

    const/16 v2, 0xd

    const-string v3, "#D50000"

    sget v4, Lcom/mikepenz/materialize/R$color;->md_red_A700:I

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/mikepenz/materialize/color/Material$Red;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$Red;->_A700:Lcom/mikepenz/materialize/color/Material$Red;

    .line 88
    const/16 v0, 0xe

    new-array v0, v0, [Lcom/mikepenz/materialize/color/Material$Red;

    sget-object v1, Lcom/mikepenz/materialize/color/Material$Red;->_50:Lcom/mikepenz/materialize/color/Material$Red;

    aput-object v1, v0, v5

    sget-object v1, Lcom/mikepenz/materialize/color/Material$Red;->_100:Lcom/mikepenz/materialize/color/Material$Red;

    aput-object v1, v0, v6

    sget-object v1, Lcom/mikepenz/materialize/color/Material$Red;->_200:Lcom/mikepenz/materialize/color/Material$Red;

    aput-object v1, v0, v7

    sget-object v1, Lcom/mikepenz/materialize/color/Material$Red;->_300:Lcom/mikepenz/materialize/color/Material$Red;

    aput-object v1, v0, v8

    sget-object v1, Lcom/mikepenz/materialize/color/Material$Red;->_400:Lcom/mikepenz/materialize/color/Material$Red;

    aput-object v1, v0, v9

    const/4 v1, 0x5

    sget-object v2, Lcom/mikepenz/materialize/color/Material$Red;->_500:Lcom/mikepenz/materialize/color/Material$Red;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/mikepenz/materialize/color/Material$Red;->_600:Lcom/mikepenz/materialize/color/Material$Red;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/mikepenz/materialize/color/Material$Red;->_700:Lcom/mikepenz/materialize/color/Material$Red;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/mikepenz/materialize/color/Material$Red;->_800:Lcom/mikepenz/materialize/color/Material$Red;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/mikepenz/materialize/color/Material$Red;->_900:Lcom/mikepenz/materialize/color/Material$Red;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/mikepenz/materialize/color/Material$Red;->_A100:Lcom/mikepenz/materialize/color/Material$Red;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcom/mikepenz/materialize/color/Material$Red;->_A200:Lcom/mikepenz/materialize/color/Material$Red;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lcom/mikepenz/materialize/color/Material$Red;->_A400:Lcom/mikepenz/materialize/color/Material$Red;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lcom/mikepenz/materialize/color/Material$Red;->_A700:Lcom/mikepenz/materialize/color/Material$Red;

    aput-object v2, v0, v1

    sput-object v0, Lcom/mikepenz/materialize/color/Material$Red;->$VALUES:[Lcom/mikepenz/materialize/color/Material$Red;

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
    .line 107
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 108
    iput-object p3, p0, Lcom/mikepenz/materialize/color/Material$Red;->color:Ljava/lang/String;

    .line 109
    iput p4, p0, Lcom/mikepenz/materialize/color/Material$Red;->resource:I

    .line 110
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/mikepenz/materialize/color/Material$Red;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 88
    const-class v0, Lcom/mikepenz/materialize/color/Material$Red;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/materialize/color/Material$Red;

    return-object v0
.end method

.method public static values()[Lcom/mikepenz/materialize/color/Material$Red;
    .registers 1

    .prologue
    .line 88
    sget-object v0, Lcom/mikepenz/materialize/color/Material$Red;->$VALUES:[Lcom/mikepenz/materialize/color/Material$Red;

    invoke-virtual {v0}, [Lcom/mikepenz/materialize/color/Material$Red;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/mikepenz/materialize/color/Material$Red;

    return-object v0
.end method


# virtual methods
.method public getAsColor()I
    .registers 2

    .prologue
    .line 119
    iget-object v0, p0, Lcom/mikepenz/materialize/color/Material$Red;->color:Ljava/lang/String;

    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getAsResource()I
    .registers 2

    .prologue
    .line 124
    iget v0, p0, Lcom/mikepenz/materialize/color/Material$Red;->resource:I

    return v0
.end method

.method public getAsString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 114
    iget-object v0, p0, Lcom/mikepenz/materialize/color/Material$Red;->color:Ljava/lang/String;

    return-object v0
.end method
