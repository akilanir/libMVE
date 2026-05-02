.class public final enum Lcom/mikepenz/materialize/color/Material$Grey;
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
    name = "Grey"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/mikepenz/materialize/color/Material$Grey;",
        ">;",
        "Lcom/mikepenz/materialize/color/IColor;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/mikepenz/materialize/color/Material$Grey;

.field public static final enum _100:Lcom/mikepenz/materialize/color/Material$Grey;

.field public static final enum _200:Lcom/mikepenz/materialize/color/Material$Grey;

.field public static final enum _300:Lcom/mikepenz/materialize/color/Material$Grey;

.field public static final enum _400:Lcom/mikepenz/materialize/color/Material$Grey;

.field public static final enum _50:Lcom/mikepenz/materialize/color/Material$Grey;

.field public static final enum _500:Lcom/mikepenz/materialize/color/Material$Grey;

.field public static final enum _600:Lcom/mikepenz/materialize/color/Material$Grey;

.field public static final enum _700:Lcom/mikepenz/materialize/color/Material$Grey;

.field public static final enum _800:Lcom/mikepenz/materialize/color/Material$Grey;

.field public static final enum _900:Lcom/mikepenz/materialize/color/Material$Grey;


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

    .line 782
    new-instance v0, Lcom/mikepenz/materialize/color/Material$Grey;

    const-string v1, "_50"

    const-string v2, "#FAFAFA"

    sget v3, Lcom/mikepenz/materialize/R$color;->md_grey_50:I

    invoke-direct {v0, v1, v5, v2, v3}, Lcom/mikepenz/materialize/color/Material$Grey;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$Grey;->_50:Lcom/mikepenz/materialize/color/Material$Grey;

    .line 783
    new-instance v0, Lcom/mikepenz/materialize/color/Material$Grey;

    const-string v1, "_100"

    const-string v2, "#F5F5F5"

    sget v3, Lcom/mikepenz/materialize/R$color;->md_grey_100:I

    invoke-direct {v0, v1, v6, v2, v3}, Lcom/mikepenz/materialize/color/Material$Grey;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$Grey;->_100:Lcom/mikepenz/materialize/color/Material$Grey;

    .line 784
    new-instance v0, Lcom/mikepenz/materialize/color/Material$Grey;

    const-string v1, "_200"

    const-string v2, "#EEEEEE"

    sget v3, Lcom/mikepenz/materialize/R$color;->md_grey_200:I

    invoke-direct {v0, v1, v7, v2, v3}, Lcom/mikepenz/materialize/color/Material$Grey;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$Grey;->_200:Lcom/mikepenz/materialize/color/Material$Grey;

    .line 785
    new-instance v0, Lcom/mikepenz/materialize/color/Material$Grey;

    const-string v1, "_300"

    const-string v2, "#E0E0E0"

    sget v3, Lcom/mikepenz/materialize/R$color;->md_grey_300:I

    invoke-direct {v0, v1, v8, v2, v3}, Lcom/mikepenz/materialize/color/Material$Grey;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$Grey;->_300:Lcom/mikepenz/materialize/color/Material$Grey;

    .line 786
    new-instance v0, Lcom/mikepenz/materialize/color/Material$Grey;

    const-string v1, "_400"

    const-string v2, "#BDBDBD"

    sget v3, Lcom/mikepenz/materialize/R$color;->md_grey_400:I

    invoke-direct {v0, v1, v9, v2, v3}, Lcom/mikepenz/materialize/color/Material$Grey;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$Grey;->_400:Lcom/mikepenz/materialize/color/Material$Grey;

    .line 787
    new-instance v0, Lcom/mikepenz/materialize/color/Material$Grey;

    const-string v1, "_500"

    const/4 v2, 0x5

    const-string v3, "#9E9E9E"

    sget v4, Lcom/mikepenz/materialize/R$color;->md_grey_500:I

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/mikepenz/materialize/color/Material$Grey;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$Grey;->_500:Lcom/mikepenz/materialize/color/Material$Grey;

    .line 788
    new-instance v0, Lcom/mikepenz/materialize/color/Material$Grey;

    const-string v1, "_600"

    const/4 v2, 0x6

    const-string v3, "#757575"

    sget v4, Lcom/mikepenz/materialize/R$color;->md_grey_600:I

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/mikepenz/materialize/color/Material$Grey;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$Grey;->_600:Lcom/mikepenz/materialize/color/Material$Grey;

    .line 789
    new-instance v0, Lcom/mikepenz/materialize/color/Material$Grey;

    const-string v1, "_700"

    const/4 v2, 0x7

    const-string v3, "#616161"

    sget v4, Lcom/mikepenz/materialize/R$color;->md_grey_700:I

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/mikepenz/materialize/color/Material$Grey;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$Grey;->_700:Lcom/mikepenz/materialize/color/Material$Grey;

    .line 790
    new-instance v0, Lcom/mikepenz/materialize/color/Material$Grey;

    const-string v1, "_800"

    const/16 v2, 0x8

    const-string v3, "#424242"

    sget v4, Lcom/mikepenz/materialize/R$color;->md_grey_800:I

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/mikepenz/materialize/color/Material$Grey;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$Grey;->_800:Lcom/mikepenz/materialize/color/Material$Grey;

    .line 791
    new-instance v0, Lcom/mikepenz/materialize/color/Material$Grey;

    const-string v1, "_900"

    const/16 v2, 0x9

    const-string v3, "#212121"

    sget v4, Lcom/mikepenz/materialize/R$color;->md_grey_900:I

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/mikepenz/materialize/color/Material$Grey;-><init>(Ljava/lang/String;ILjava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/materialize/color/Material$Grey;->_900:Lcom/mikepenz/materialize/color/Material$Grey;

    .line 780
    const/16 v0, 0xa

    new-array v0, v0, [Lcom/mikepenz/materialize/color/Material$Grey;

    sget-object v1, Lcom/mikepenz/materialize/color/Material$Grey;->_50:Lcom/mikepenz/materialize/color/Material$Grey;

    aput-object v1, v0, v5

    sget-object v1, Lcom/mikepenz/materialize/color/Material$Grey;->_100:Lcom/mikepenz/materialize/color/Material$Grey;

    aput-object v1, v0, v6

    sget-object v1, Lcom/mikepenz/materialize/color/Material$Grey;->_200:Lcom/mikepenz/materialize/color/Material$Grey;

    aput-object v1, v0, v7

    sget-object v1, Lcom/mikepenz/materialize/color/Material$Grey;->_300:Lcom/mikepenz/materialize/color/Material$Grey;

    aput-object v1, v0, v8

    sget-object v1, Lcom/mikepenz/materialize/color/Material$Grey;->_400:Lcom/mikepenz/materialize/color/Material$Grey;

    aput-object v1, v0, v9

    const/4 v1, 0x5

    sget-object v2, Lcom/mikepenz/materialize/color/Material$Grey;->_500:Lcom/mikepenz/materialize/color/Material$Grey;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/mikepenz/materialize/color/Material$Grey;->_600:Lcom/mikepenz/materialize/color/Material$Grey;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/mikepenz/materialize/color/Material$Grey;->_700:Lcom/mikepenz/materialize/color/Material$Grey;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/mikepenz/materialize/color/Material$Grey;->_800:Lcom/mikepenz/materialize/color/Material$Grey;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/mikepenz/materialize/color/Material$Grey;->_900:Lcom/mikepenz/materialize/color/Material$Grey;

    aput-object v2, v0, v1

    sput-object v0, Lcom/mikepenz/materialize/color/Material$Grey;->$VALUES:[Lcom/mikepenz/materialize/color/Material$Grey;

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
    .line 796
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 797
    iput-object p3, p0, Lcom/mikepenz/materialize/color/Material$Grey;->color:Ljava/lang/String;

    .line 798
    iput p4, p0, Lcom/mikepenz/materialize/color/Material$Grey;->resource:I

    .line 799
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/mikepenz/materialize/color/Material$Grey;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 780
    const-class v0, Lcom/mikepenz/materialize/color/Material$Grey;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/materialize/color/Material$Grey;

    return-object v0
.end method

.method public static values()[Lcom/mikepenz/materialize/color/Material$Grey;
    .registers 1

    .prologue
    .line 780
    sget-object v0, Lcom/mikepenz/materialize/color/Material$Grey;->$VALUES:[Lcom/mikepenz/materialize/color/Material$Grey;

    invoke-virtual {v0}, [Lcom/mikepenz/materialize/color/Material$Grey;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/mikepenz/materialize/color/Material$Grey;

    return-object v0
.end method


# virtual methods
.method public getAsColor()I
    .registers 2

    .prologue
    .line 808
    iget-object v0, p0, Lcom/mikepenz/materialize/color/Material$Grey;->color:Ljava/lang/String;

    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getAsResource()I
    .registers 2

    .prologue
    .line 813
    iget v0, p0, Lcom/mikepenz/materialize/color/Material$Grey;->resource:I

    return v0
.end method

.method public getAsString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 803
    iget-object v0, p0, Lcom/mikepenz/materialize/color/Material$Grey;->color:Ljava/lang/String;

    return-object v0
.end method
