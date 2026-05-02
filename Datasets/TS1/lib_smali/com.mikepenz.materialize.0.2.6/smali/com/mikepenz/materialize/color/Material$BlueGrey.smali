.class public final enum Lcom/mikepenz/materialize/color/Material$BlueGrey;
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
    name = "BlueGrey"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/mikepenz/materialize/color/Material$BlueGrey;",
        ">;",
        "Lcom/mikepenz/materialize/color/IColor;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/mikepenz/materialize/color/Material$BlueGrey;

.field public static final enum _100:Lcom/mikepenz/materialize/color/Material$BlueGrey;

.field public static final enum _200:Lcom/mikepenz/materialize/color/Material$BlueGrey;

.field public static final enum _300:Lcom/mikepenz/materialize/color/Material$BlueGrey;

.field public static final enum _400:Lcom/mikepenz/materialize/color/Material$BlueGrey;

.field public static final enum _50:Lcom/mikepenz/materialize/color/Material$BlueGrey;

.field public static final enum _500:Lcom/mikepenz/materialize/color/Material$BlueGrey;

.field public static final enum _600:Lcom/mikepenz/materialize/color/Material$BlueGrey;

.field public static final enum _700:Lcom/mikepenz/materialize/color/Material$BlueGrey;

.field public static final enum _800:Lcom/mikepenz/materialize/color/Material$BlueGrey;

.field public static final enum _900:Lcom/mikepenz/materialize/color/Material$BlueGrey;


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

    .line 819
    new-instance v0, Lcom/mikepenz/materialize/color/Material$BlueGrey;

    const-string v1, "_50"

    const-string v2, "#ECEFF1"

    sget v3, Lcom/mikepenz/materialize/R$color;->md_blue_grey_50:I

    invoke-direct {v0, v1, v5, v2, v3}, Lcom/mikepenz/materialize/color/Material$BlueGrey;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$BlueGrey;->_50:Lcom/mikepenz/materialize/color/Material$BlueGrey;

    .line 820
    new-instance v0, Lcom/mikepenz/materialize/color/Material$BlueGrey;

    const-string v1, "_100"

    const-string v2, "#CFD8DC"

    sget v3, Lcom/mikepenz/materialize/R$color;->md_blue_grey_100:I

    invoke-direct {v0, v1, v6, v2, v3}, Lcom/mikepenz/materialize/color/Material$BlueGrey;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$BlueGrey;->_100:Lcom/mikepenz/materialize/color/Material$BlueGrey;

    .line 821
    new-instance v0, Lcom/mikepenz/materialize/color/Material$BlueGrey;

    const-string v1, "_200"

    const-string v2, "#B0BEC5"

    sget v3, Lcom/mikepenz/materialize/R$color;->md_blue_grey_200:I

    invoke-direct {v0, v1, v7, v2, v3}, Lcom/mikepenz/materialize/color/Material$BlueGrey;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$BlueGrey;->_200:Lcom/mikepenz/materialize/color/Material$BlueGrey;

    .line 822
    new-instance v0, Lcom/mikepenz/materialize/color/Material$BlueGrey;

    const-string v1, "_300"

    const-string v2, "#90A4AE"

    sget v3, Lcom/mikepenz/materialize/R$color;->md_blue_grey_300:I

    invoke-direct {v0, v1, v8, v2, v3}, Lcom/mikepenz/materialize/color/Material$BlueGrey;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$BlueGrey;->_300:Lcom/mikepenz/materialize/color/Material$BlueGrey;

    .line 823
    new-instance v0, Lcom/mikepenz/materialize/color/Material$BlueGrey;

    const-string v1, "_400"

    const-string v2, "#78909C"

    sget v3, Lcom/mikepenz/materialize/R$color;->md_blue_grey_400:I

    invoke-direct {v0, v1, v9, v2, v3}, Lcom/mikepenz/materialize/color/Material$BlueGrey;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$BlueGrey;->_400:Lcom/mikepenz/materialize/color/Material$BlueGrey;

    .line 824
    new-instance v0, Lcom/mikepenz/materialize/color/Material$BlueGrey;

    const-string v1, "_500"

    const/4 v2, 0x5

    const-string v3, "#607D8B"

    sget v4, Lcom/mikepenz/materialize/R$color;->md_blue_grey_500:I

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/mikepenz/materialize/color/Material$BlueGrey;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$BlueGrey;->_500:Lcom/mikepenz/materialize/color/Material$BlueGrey;

    .line 825
    new-instance v0, Lcom/mikepenz/materialize/color/Material$BlueGrey;

    const-string v1, "_600"

    const/4 v2, 0x6

    const-string v3, "#546E7A"

    sget v4, Lcom/mikepenz/materialize/R$color;->md_blue_grey_600:I

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/mikepenz/materialize/color/Material$BlueGrey;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$BlueGrey;->_600:Lcom/mikepenz/materialize/color/Material$BlueGrey;

    .line 826
    new-instance v0, Lcom/mikepenz/materialize/color/Material$BlueGrey;

    const-string v1, "_700"

    const/4 v2, 0x7

    const-string v3, "#455A64"

    sget v4, Lcom/mikepenz/materialize/R$color;->md_blue_grey_700:I

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/mikepenz/materialize/color/Material$BlueGrey;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$BlueGrey;->_700:Lcom/mikepenz/materialize/color/Material$BlueGrey;

    .line 827
    new-instance v0, Lcom/mikepenz/materialize/color/Material$BlueGrey;

    const-string v1, "_800"

    const/16 v2, 0x8

    const-string v3, "#37474F"

    sget v4, Lcom/mikepenz/materialize/R$color;->md_blue_grey_800:I

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/mikepenz/materialize/color/Material$BlueGrey;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$BlueGrey;->_800:Lcom/mikepenz/materialize/color/Material$BlueGrey;

    .line 828
    new-instance v0, Lcom/mikepenz/materialize/color/Material$BlueGrey;

    const-string v1, "_900"

    const/16 v2, 0x9

    const-string v3, "#263238"

    sget v4, Lcom/mikepenz/materialize/R$color;->md_blue_grey_900:I

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/mikepenz/materialize/color/Material$BlueGrey;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$BlueGrey;->_900:Lcom/mikepenz/materialize/color/Material$BlueGrey;

    .line 817
    const/16 v0, 0xa

    new-array v0, v0, [Lcom/mikepenz/materialize/color/Material$BlueGrey;

    sget-object v1, Lcom/mikepenz/materialize/color/Material$BlueGrey;->_50:Lcom/mikepenz/materialize/color/Material$BlueGrey;

    aput-object v1, v0, v5

    sget-object v1, Lcom/mikepenz/materialize/color/Material$BlueGrey;->_100:Lcom/mikepenz/materialize/color/Material$BlueGrey;

    aput-object v1, v0, v6

    sget-object v1, Lcom/mikepenz/materialize/color/Material$BlueGrey;->_200:Lcom/mikepenz/materialize/color/Material$BlueGrey;

    aput-object v1, v0, v7

    sget-object v1, Lcom/mikepenz/materialize/color/Material$BlueGrey;->_300:Lcom/mikepenz/materialize/color/Material$BlueGrey;

    aput-object v1, v0, v8

    sget-object v1, Lcom/mikepenz/materialize/color/Material$BlueGrey;->_400:Lcom/mikepenz/materialize/color/Material$BlueGrey;

    aput-object v1, v0, v9

    const/4 v1, 0x5

    sget-object v2, Lcom/mikepenz/materialize/color/Material$BlueGrey;->_500:Lcom/mikepenz/materialize/color/Material$BlueGrey;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/mikepenz/materialize/color/Material$BlueGrey;->_600:Lcom/mikepenz/materialize/color/Material$BlueGrey;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/mikepenz/materialize/color/Material$BlueGrey;->_700:Lcom/mikepenz/materialize/color/Material$BlueGrey;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/mikepenz/materialize/color/Material$BlueGrey;->_800:Lcom/mikepenz/materialize/color/Material$BlueGrey;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/mikepenz/materialize/color/Material$BlueGrey;->_900:Lcom/mikepenz/materialize/color/Material$BlueGrey;

    aput-object v2, v0, v1

    sput-object v0, Lcom/mikepenz/materialize/color/Material$BlueGrey;->$VALUES:[Lcom/mikepenz/materialize/color/Material$BlueGrey;

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
    .line 833
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 834
    iput-object p3, p0, Lcom/mikepenz/materialize/color/Material$BlueGrey;->color:Ljava/lang/String;

    .line 835
    iput p4, p0, Lcom/mikepenz/materialize/color/Material$BlueGrey;->resource:I

    .line 836
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/mikepenz/materialize/color/Material$BlueGrey;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 817
    const-class v0, Lcom/mikepenz/materialize/color/Material$BlueGrey;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/materialize/color/Material$BlueGrey;

    return-object v0
.end method

.method public static values()[Lcom/mikepenz/materialize/color/Material$BlueGrey;
    .registers 1

    .prologue
    .line 817
    sget-object v0, Lcom/mikepenz/materialize/color/Material$BlueGrey;->$VALUES:[Lcom/mikepenz/materialize/color/Material$BlueGrey;

    invoke-virtual {v0}, [Lcom/mikepenz/materialize/color/Material$BlueGrey;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/mikepenz/materialize/color/Material$BlueGrey;

    return-object v0
.end method


# virtual methods
.method public getAsColor()I
    .registers 2

    .prologue
    .line 845
    iget-object v0, p0, Lcom/mikepenz/materialize/color/Material$BlueGrey;->color:Ljava/lang/String;

    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getAsResource()I
    .registers 2

    .prologue
    .line 850
    iget v0, p0, Lcom/mikepenz/materialize/color/Material$BlueGrey;->resource:I

    return v0
.end method

.method public getAsString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 840
    iget-object v0, p0, Lcom/mikepenz/materialize/color/Material$BlueGrey;->color:Ljava/lang/String;

    return-object v0
.end method
