.class final Lcom/jjoe64/graphview/LegendRenderer$Styles;
.super Ljava/lang/Object;
.source "LegendRenderer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jjoe64/graphview/LegendRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "Styles"
.end annotation


# instance fields
.field align:Lcom/jjoe64/graphview/LegendRenderer$LegendAlign;

.field backgroundColor:I

.field fixedPosition:Landroid/graphics/Point;

.field margin:I

.field padding:I

.field spacing:I

.field textColor:I

.field textSize:F

.field final synthetic this$0:Lcom/jjoe64/graphview/LegendRenderer;

.field width:I


# direct methods
.method private constructor <init>(Lcom/jjoe64/graphview/LegendRenderer;)V
    .registers 2

    .prologue
    .line 46
    iput-object p1, p0, Lcom/jjoe64/graphview/LegendRenderer$Styles;->this$0:Lcom/jjoe64/graphview/LegendRenderer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/jjoe64/graphview/LegendRenderer;Lcom/jjoe64/graphview/LegendRenderer$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/jjoe64/graphview/LegendRenderer;
    .param p2, "x1"    # Lcom/jjoe64/graphview/LegendRenderer$1;

    .prologue
    .line 46
    invoke-direct {p0, p1}, Lcom/jjoe64/graphview/LegendRenderer$Styles;-><init>(Lcom/jjoe64/graphview/LegendRenderer;)V

    return-void
.end method
