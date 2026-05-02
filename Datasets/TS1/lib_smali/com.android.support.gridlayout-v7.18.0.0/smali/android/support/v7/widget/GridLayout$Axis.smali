.class final Landroid/support/v7/widget/GridLayout$Axis;
.super Ljava/lang/Object;
.source "GridLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/GridLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "Axis"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final COMPLETE:I = 0x2

.field private static final NEW:I = 0x0

.field private static final PENDING:I = 0x1


# instance fields
.field public arcs:[Landroid/support/v7/widget/GridLayout$Arc;

.field public arcsValid:Z

.field backwardLinks:Landroid/support/v7/widget/GridLayout$PackedMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v7/widget/GridLayout$PackedMap",
            "<",
            "Landroid/support/v7/widget/GridLayout$Interval;",
            "Landroid/support/v7/widget/GridLayout$MutableInt;",
            ">;"
        }
    .end annotation
.end field

.field public backwardLinksValid:Z

.field public definedCount:I

.field forwardLinks:Landroid/support/v7/widget/GridLayout$PackedMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v7/widget/GridLayout$PackedMap",
            "<",
            "Landroid/support/v7/widget/GridLayout$Interval;",
            "Landroid/support/v7/widget/GridLayout$MutableInt;",
            ">;"
        }
    .end annotation
.end field

.field public forwardLinksValid:Z

.field groupBounds:Landroid/support/v7/widget/GridLayout$PackedMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v7/widget/GridLayout$PackedMap",
            "<",
            "Landroid/support/v7/widget/GridLayout$Spec;",
            "Landroid/support/v7/widget/GridLayout$Bounds;",
            ">;"
        }
    .end annotation
.end field

.field public groupBoundsValid:Z

.field public final horizontal:Z

.field public leadingMargins:[I

.field public leadingMarginsValid:Z

.field public locations:[I

.field public locationsValid:Z

.field private maxIndex:I

.field orderPreserved:Z

.field private parentMax:Landroid/support/v7/widget/GridLayout$MutableInt;

.field private parentMin:Landroid/support/v7/widget/GridLayout$MutableInt;

.field final synthetic this$0:Landroid/support/v7/widget/GridLayout;

.field public trailingMargins:[I

.field public trailingMarginsValid:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 1090
    const-class v0, Landroid/support/v7/widget/GridLayout;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Landroid/support/v7/widget/GridLayout$Axis;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private constructor <init>(Landroid/support/v7/widget/GridLayout;Z)V
    .registers 5
    .param p2, "horizontal"    # Z

    .prologue
    const/high16 v0, -0x80000000

    const/4 v1, 0x0

    .line 1126
    iput-object p1, p0, Landroid/support/v7/widget/GridLayout$Axis;->this$0:Landroid/support/v7/widget/GridLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1097
    iput v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->definedCount:I

    .line 1098
    iput v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->maxIndex:I

    .line 1101
    iput-boolean v1, p0, Landroid/support/v7/widget/GridLayout$Axis;->groupBoundsValid:Z

    .line 1104
    iput-boolean v1, p0, Landroid/support/v7/widget/GridLayout$Axis;->forwardLinksValid:Z

    .line 1107
    iput-boolean v1, p0, Landroid/support/v7/widget/GridLayout$Axis;->backwardLinksValid:Z

    .line 1110
    iput-boolean v1, p0, Landroid/support/v7/widget/GridLayout$Axis;->leadingMarginsValid:Z

    .line 1113
    iput-boolean v1, p0, Landroid/support/v7/widget/GridLayout$Axis;->trailingMarginsValid:Z

    .line 1116
    iput-boolean v1, p0, Landroid/support/v7/widget/GridLayout$Axis;->arcsValid:Z

    .line 1119
    iput-boolean v1, p0, Landroid/support/v7/widget/GridLayout$Axis;->locationsValid:Z

    .line 1121
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->orderPreserved:Z

    .line 1123
    new-instance v0, Landroid/support/v7/widget/GridLayout$MutableInt;

    invoke-direct {v0, v1}, Landroid/support/v7/widget/GridLayout$MutableInt;-><init>(I)V

    iput-object v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->parentMin:Landroid/support/v7/widget/GridLayout$MutableInt;

    .line 1124
    new-instance v0, Landroid/support/v7/widget/GridLayout$MutableInt;

    const v1, -0x186a0

    invoke-direct {v0, v1}, Landroid/support/v7/widget/GridLayout$MutableInt;-><init>(I)V

    iput-object v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->parentMax:Landroid/support/v7/widget/GridLayout$MutableInt;

    .line 1127
    iput-boolean p2, p0, Landroid/support/v7/widget/GridLayout$Axis;->horizontal:Z

    .line 1128
    return-void
.end method

.method synthetic constructor <init>(Landroid/support/v7/widget/GridLayout;ZLandroid/support/v7/widget/GridLayout$1;)V
    .registers 4
    .param p1, "x0"    # Landroid/support/v7/widget/GridLayout;
    .param p2, "x1"    # Z
    .param p3, "x2"    # Landroid/support/v7/widget/GridLayout$1;

    .prologue
    .line 1090
    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/GridLayout$Axis;-><init>(Landroid/support/v7/widget/GridLayout;Z)V

    return-void
.end method

.method private addComponentSizes(Ljava/util/List;Landroid/support/v7/widget/GridLayout$PackedMap;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/widget/GridLayout$Arc;",
            ">;",
            "Landroid/support/v7/widget/GridLayout$PackedMap",
            "<",
            "Landroid/support/v7/widget/GridLayout$Interval;",
            "Landroid/support/v7/widget/GridLayout$MutableInt;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1346
    .local p1, "result":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/widget/GridLayout$Arc;>;"
    .local p2, "links":Landroid/support/v7/widget/GridLayout$PackedMap;, "Landroid/support/v7/widget/GridLayout$PackedMap<Landroid/support/v7/widget/GridLayout$Interval;Landroid/support/v7/widget/GridLayout$MutableInt;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v2, p2, Landroid/support/v7/widget/GridLayout$PackedMap;->keys:[Ljava/lang/Object;

    check-cast v2, [Landroid/support/v7/widget/GridLayout$Interval;

    array-length v2, v2

    if-ge v0, v2, :cond_1b

    .line 1347
    iget-object v2, p2, Landroid/support/v7/widget/GridLayout$PackedMap;->keys:[Ljava/lang/Object;

    check-cast v2, [Landroid/support/v7/widget/GridLayout$Interval;

    aget-object v1, v2, v0

    .line 1348
    .local v1, "key":Landroid/support/v7/widget/GridLayout$Interval;
    iget-object v2, p2, Landroid/support/v7/widget/GridLayout$PackedMap;->values:[Ljava/lang/Object;

    check-cast v2, [Landroid/support/v7/widget/GridLayout$MutableInt;

    aget-object v2, v2, v0

    const/4 v3, 0x0

    invoke-direct {p0, p1, v1, v2, v3}, Landroid/support/v7/widget/GridLayout$Axis;->include(Ljava/util/List;Landroid/support/v7/widget/GridLayout$Interval;Landroid/support/v7/widget/GridLayout$MutableInt;Z)V

    .line 1346
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1350
    .end local v1    # "key":Landroid/support/v7/widget/GridLayout$Interval;
    :cond_1b
    return-void
.end method

.method private arcsToString(Ljava/util/List;)Ljava/lang/String;
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/widget/GridLayout$Arc;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 1420
    .local p1, "arcs":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/widget/GridLayout$Arc;>;"
    iget-boolean v8, p0, Landroid/support/v7/widget/GridLayout$Axis;->horizontal:Z

    if-eqz v8, :cond_5a

    const-string v7, "x"

    .line 1421
    .local v7, "var":Ljava/lang/String;
    :goto_6
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 1422
    .local v4, "result":Ljava/lang/StringBuilder;
    const/4 v2, 0x1

    .line 1423
    .local v2, "first":Z
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_10
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_8f

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/GridLayout$Arc;

    .line 1424
    .local v0, "arc":Landroid/support/v7/widget/GridLayout$Arc;
    if-eqz v2, :cond_5d

    .line 1425
    const/4 v2, 0x0

    .line 1429
    :goto_1f
    iget-object v8, v0, Landroid/support/v7/widget/GridLayout$Arc;->span:Landroid/support/v7/widget/GridLayout$Interval;

    iget v5, v8, Landroid/support/v7/widget/GridLayout$Interval;->min:I

    .line 1430
    .local v5, "src":I
    iget-object v8, v0, Landroid/support/v7/widget/GridLayout$Arc;->span:Landroid/support/v7/widget/GridLayout$Interval;

    iget v1, v8, Landroid/support/v7/widget/GridLayout$Interval;->max:I

    .line 1431
    .local v1, "dst":I
    iget-object v8, v0, Landroid/support/v7/widget/GridLayout$Arc;->value:Landroid/support/v7/widget/GridLayout$MutableInt;

    iget v6, v8, Landroid/support/v7/widget/GridLayout$MutableInt;->value:I

    .line 1432
    .local v6, "value":I
    if-ge v5, v1, :cond_64

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " - "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " > "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    :goto_56
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_10

    .line 1420
    .end local v0    # "arc":Landroid/support/v7/widget/GridLayout$Arc;
    .end local v1    # "dst":I
    .end local v2    # "first":Z
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "result":Ljava/lang/StringBuilder;
    .end local v5    # "src":I
    .end local v6    # "value":I
    .end local v7    # "var":Ljava/lang/String;
    :cond_5a
    const-string v7, "y"

    goto :goto_6

    .line 1427
    .restart local v0    # "arc":Landroid/support/v7/widget/GridLayout$Arc;
    .restart local v2    # "first":Z
    .restart local v3    # "i$":Ljava/util/Iterator;
    .restart local v4    # "result":Ljava/lang/StringBuilder;
    .restart local v7    # "var":Ljava/lang/String;
    :cond_5d
    const-string v8, ", "

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    goto :goto_1f

    .line 1432
    .restart local v1    # "dst":I
    .restart local v5    # "src":I
    .restart local v6    # "value":I
    :cond_64
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " - "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " < "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    neg-int v9, v6

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    goto :goto_56

    .line 1437
    .end local v0    # "arc":Landroid/support/v7/widget/GridLayout$Arc;
    .end local v1    # "dst":I
    .end local v5    # "src":I
    .end local v6    # "value":I
    :cond_8f
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    return-object v8
.end method

.method private calculateMaxIndex()I
    .registers 9

    .prologue
    .line 1132
    const/4 v4, -0x1

    .line 1133
    .local v4, "result":I
    const/4 v2, 0x0

    .local v2, "i":I
    iget-object v7, p0, Landroid/support/v7/widget/GridLayout$Axis;->this$0:Landroid/support/v7/widget/GridLayout;

    invoke-virtual {v7}, Landroid/support/v7/widget/GridLayout;->getChildCount()I

    move-result v0

    .local v0, "N":I
    :goto_8
    if-ge v2, v0, :cond_30

    .line 1134
    iget-object v7, p0, Landroid/support/v7/widget/GridLayout$Axis;->this$0:Landroid/support/v7/widget/GridLayout;

    invoke-virtual {v7, v2}, Landroid/support/v7/widget/GridLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 1135
    .local v1, "c":Landroid/view/View;
    iget-object v7, p0, Landroid/support/v7/widget/GridLayout$Axis;->this$0:Landroid/support/v7/widget/GridLayout;

    invoke-virtual {v7, v1}, Landroid/support/v7/widget/GridLayout;->getLayoutParams(Landroid/view/View;)Landroid/support/v7/widget/GridLayout$LayoutParams;

    move-result-object v3

    .line 1136
    .local v3, "params":Landroid/support/v7/widget/GridLayout$LayoutParams;
    iget-boolean v7, p0, Landroid/support/v7/widget/GridLayout$Axis;->horizontal:Z

    if-eqz v7, :cond_2d

    iget-object v6, v3, Landroid/support/v7/widget/GridLayout$LayoutParams;->columnSpec:Landroid/support/v7/widget/GridLayout$Spec;

    .line 1137
    .local v6, "spec":Landroid/support/v7/widget/GridLayout$Spec;
    :goto_1c
    iget-object v5, v6, Landroid/support/v7/widget/GridLayout$Spec;->span:Landroid/support/v7/widget/GridLayout$Interval;

    .line 1138
    .local v5, "span":Landroid/support/v7/widget/GridLayout$Interval;
    iget v7, v5, Landroid/support/v7/widget/GridLayout$Interval;->min:I

    invoke-static {v4, v7}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 1139
    iget v7, v5, Landroid/support/v7/widget/GridLayout$Interval;->max:I

    invoke-static {v4, v7}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 1133
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 1136
    .end local v5    # "span":Landroid/support/v7/widget/GridLayout$Interval;
    .end local v6    # "spec":Landroid/support/v7/widget/GridLayout$Spec;
    :cond_2d
    iget-object v6, v3, Landroid/support/v7/widget/GridLayout$LayoutParams;->rowSpec:Landroid/support/v7/widget/GridLayout$Spec;

    goto :goto_1c

    .line 1141
    .end local v1    # "c":Landroid/view/View;
    .end local v3    # "params":Landroid/support/v7/widget/GridLayout$LayoutParams;
    :cond_30
    const/4 v7, -0x1

    if-ne v4, v7, :cond_35

    const/high16 v4, -0x80000000

    .end local v4    # "result":I
    :cond_35
    return v4
.end method

.method private computeArcs()V
    .registers 1

    .prologue
    .line 1384
    invoke-direct {p0}, Landroid/support/v7/widget/GridLayout$Axis;->getForwardLinks()Landroid/support/v7/widget/GridLayout$PackedMap;

    .line 1385
    invoke-direct {p0}, Landroid/support/v7/widget/GridLayout$Axis;->getBackwardLinks()Landroid/support/v7/widget/GridLayout$PackedMap;

    .line 1386
    return-void
.end method

.method private computeGroupBounds()V
    .registers 9

    .prologue
    .line 1181
    iget-object v6, p0, Landroid/support/v7/widget/GridLayout$Axis;->groupBounds:Landroid/support/v7/widget/GridLayout$PackedMap;

    iget-object v5, v6, Landroid/support/v7/widget/GridLayout$PackedMap;->values:[Ljava/lang/Object;

    check-cast v5, [Landroid/support/v7/widget/GridLayout$Bounds;

    .line 1182
    .local v5, "values":[Landroid/support/v7/widget/GridLayout$Bounds;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_7
    array-length v6, v5

    if-ge v2, v6, :cond_12

    .line 1183
    aget-object v6, v5, v2

    invoke-virtual {v6}, Landroid/support/v7/widget/GridLayout$Bounds;->reset()V

    .line 1182
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 1185
    :cond_12
    const/4 v2, 0x0

    iget-object v6, p0, Landroid/support/v7/widget/GridLayout$Axis;->this$0:Landroid/support/v7/widget/GridLayout;

    invoke-virtual {v6}, Landroid/support/v7/widget/GridLayout;->getChildCount()I

    move-result v0

    .local v0, "N":I
    :goto_19
    if-ge v2, v0, :cond_40

    .line 1186
    iget-object v6, p0, Landroid/support/v7/widget/GridLayout$Axis;->this$0:Landroid/support/v7/widget/GridLayout;

    invoke-virtual {v6, v2}, Landroid/support/v7/widget/GridLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 1187
    .local v1, "c":Landroid/view/View;
    iget-object v6, p0, Landroid/support/v7/widget/GridLayout$Axis;->this$0:Landroid/support/v7/widget/GridLayout;

    invoke-virtual {v6, v1}, Landroid/support/v7/widget/GridLayout;->getLayoutParams(Landroid/view/View;)Landroid/support/v7/widget/GridLayout$LayoutParams;

    move-result-object v3

    .line 1188
    .local v3, "lp":Landroid/support/v7/widget/GridLayout$LayoutParams;
    iget-boolean v6, p0, Landroid/support/v7/widget/GridLayout$Axis;->horizontal:Z

    if-eqz v6, :cond_3d

    iget-object v4, v3, Landroid/support/v7/widget/GridLayout$LayoutParams;->columnSpec:Landroid/support/v7/widget/GridLayout$Spec;

    .line 1189
    .local v4, "spec":Landroid/support/v7/widget/GridLayout$Spec;
    :goto_2d
    iget-object v6, p0, Landroid/support/v7/widget/GridLayout$Axis;->groupBounds:Landroid/support/v7/widget/GridLayout$PackedMap;

    invoke-virtual {v6, v2}, Landroid/support/v7/widget/GridLayout$PackedMap;->getValue(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/support/v7/widget/GridLayout$Bounds;

    iget-object v7, p0, Landroid/support/v7/widget/GridLayout$Axis;->this$0:Landroid/support/v7/widget/GridLayout;

    invoke-virtual {v6, v1, v4, v7, p0}, Landroid/support/v7/widget/GridLayout$Bounds;->include(Landroid/view/View;Landroid/support/v7/widget/GridLayout$Spec;Landroid/support/v7/widget/GridLayout;Landroid/support/v7/widget/GridLayout$Axis;)V

    .line 1185
    add-int/lit8 v2, v2, 0x1

    goto :goto_19

    .line 1188
    .end local v4    # "spec":Landroid/support/v7/widget/GridLayout$Spec;
    :cond_3d
    iget-object v4, v3, Landroid/support/v7/widget/GridLayout$LayoutParams;->rowSpec:Landroid/support/v7/widget/GridLayout$Spec;

    goto :goto_2d

    .line 1191
    .end local v1    # "c":Landroid/view/View;
    .end local v3    # "lp":Landroid/support/v7/widget/GridLayout$LayoutParams;
    :cond_40
    return-void
.end method

.method private computeLinks(Landroid/support/v7/widget/GridLayout$PackedMap;Z)V
    .registers 9
    .param p2, "min"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v7/widget/GridLayout$PackedMap",
            "<",
            "Landroid/support/v7/widget/GridLayout$Interval;",
            "Landroid/support/v7/widget/GridLayout$MutableInt;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 1216
    .local p1, "links":Landroid/support/v7/widget/GridLayout$PackedMap;, "Landroid/support/v7/widget/GridLayout$PackedMap<Landroid/support/v7/widget/GridLayout$Interval;Landroid/support/v7/widget/GridLayout$MutableInt;>;"
    iget-object v3, p1, Landroid/support/v7/widget/GridLayout$PackedMap;->values:[Ljava/lang/Object;

    check-cast v3, [Landroid/support/v7/widget/GridLayout$MutableInt;

    .line 1217
    .local v3, "spans":[Landroid/support/v7/widget/GridLayout$MutableInt;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_5
    array-length v5, v3

    if-ge v1, v5, :cond_10

    .line 1218
    aget-object v5, v3, v1

    invoke-virtual {v5}, Landroid/support/v7/widget/GridLayout$MutableInt;->reset()V

    .line 1217
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 1222
    :cond_10
    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayout$Axis;->getGroupBounds()Landroid/support/v7/widget/GridLayout$PackedMap;

    move-result-object v5

    iget-object v0, v5, Landroid/support/v7/widget/GridLayout$PackedMap;->values:[Ljava/lang/Object;

    check-cast v0, [Landroid/support/v7/widget/GridLayout$Bounds;

    .line 1223
    .local v0, "bounds":[Landroid/support/v7/widget/GridLayout$Bounds;
    const/4 v1, 0x0

    :goto_19
    array-length v5, v0

    if-ge v1, v5, :cond_37

    .line 1224
    aget-object v5, v0, v1

    invoke-virtual {v5, p2}, Landroid/support/v7/widget/GridLayout$Bounds;->size(Z)I

    move-result v2

    .line 1225
    .local v2, "size":I
    invoke-virtual {p1, v1}, Landroid/support/v7/widget/GridLayout$PackedMap;->getValue(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/v7/widget/GridLayout$MutableInt;

    .line 1227
    .local v4, "valueHolder":Landroid/support/v7/widget/GridLayout$MutableInt;
    iget v5, v4, Landroid/support/v7/widget/GridLayout$MutableInt;->value:I

    if-eqz p2, :cond_35

    .end local v2    # "size":I
    :goto_2c
    invoke-static {v5, v2}, Ljava/lang/Math;->max(II)I

    move-result v5

    iput v5, v4, Landroid/support/v7/widget/GridLayout$MutableInt;->value:I

    .line 1223
    add-int/lit8 v1, v1, 0x1

    goto :goto_19

    .line 1227
    .restart local v2    # "size":I
    :cond_35
    neg-int v2, v2

    goto :goto_2c

    .line 1229
    .end local v2    # "size":I
    .end local v4    # "valueHolder":Landroid/support/v7/widget/GridLayout$MutableInt;
    :cond_37
    return-void
.end method

.method private computeLocations([I)V
    .registers 6
    .param p1, "a"    # [I

    .prologue
    .line 1575
    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayout$Axis;->getArcs()[Landroid/support/v7/widget/GridLayout$Arc;

    move-result-object v3

    invoke-direct {p0, v3, p1}, Landroid/support/v7/widget/GridLayout$Axis;->solve([Landroid/support/v7/widget/GridLayout$Arc;[I)V

    .line 1576
    iget-boolean v3, p0, Landroid/support/v7/widget/GridLayout$Axis;->orderPreserved:Z

    if-nez v3, :cond_1a

    .line 1583
    const/4 v3, 0x0

    aget v1, p1, v3

    .line 1584
    .local v1, "a0":I
    const/4 v2, 0x0

    .local v2, "i":I
    array-length v0, p1

    .local v0, "N":I
    :goto_10
    if-ge v2, v0, :cond_1a

    .line 1585
    aget v3, p1, v2

    sub-int/2addr v3, v1

    aput v3, p1, v2

    .line 1584
    add-int/lit8 v2, v2, 0x1

    goto :goto_10

    .line 1588
    .end local v0    # "N":I
    .end local v1    # "a0":I
    .end local v2    # "i":I
    :cond_1a
    return-void
.end method

.method private computeMargins(Z)V
    .registers 13
    .param p1, "leading"    # Z

    .prologue
    .line 1538
    if-eqz p1, :cond_1e

    iget-object v5, p0, Landroid/support/v7/widget/GridLayout$Axis;->leadingMargins:[I

    .line 1539
    .local v5, "margins":[I
    :goto_4
    const/4 v2, 0x0

    .local v2, "i":I
    iget-object v8, p0, Landroid/support/v7/widget/GridLayout$Axis;->this$0:Landroid/support/v7/widget/GridLayout;

    invoke-virtual {v8}, Landroid/support/v7/widget/GridLayout;->getChildCount()I

    move-result v0

    .local v0, "N":I
    :goto_b
    if-ge v2, v0, :cond_4a

    .line 1540
    iget-object v8, p0, Landroid/support/v7/widget/GridLayout$Axis;->this$0:Landroid/support/v7/widget/GridLayout;

    invoke-virtual {v8, v2}, Landroid/support/v7/widget/GridLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 1541
    .local v1, "c":Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v8

    const/16 v9, 0x8

    if-ne v8, v9, :cond_21

    .line 1539
    :goto_1b
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    .line 1538
    .end local v0    # "N":I
    .end local v1    # "c":Landroid/view/View;
    .end local v2    # "i":I
    .end local v5    # "margins":[I
    :cond_1e
    iget-object v5, p0, Landroid/support/v7/widget/GridLayout$Axis;->trailingMargins:[I

    goto :goto_4

    .line 1542
    .restart local v0    # "N":I
    .restart local v1    # "c":Landroid/view/View;
    .restart local v2    # "i":I
    .restart local v5    # "margins":[I
    :cond_21
    iget-object v8, p0, Landroid/support/v7/widget/GridLayout$Axis;->this$0:Landroid/support/v7/widget/GridLayout;

    invoke-virtual {v8, v1}, Landroid/support/v7/widget/GridLayout;->getLayoutParams(Landroid/view/View;)Landroid/support/v7/widget/GridLayout$LayoutParams;

    move-result-object v4

    .line 1543
    .local v4, "lp":Landroid/support/v7/widget/GridLayout$LayoutParams;
    iget-boolean v8, p0, Landroid/support/v7/widget/GridLayout$Axis;->horizontal:Z

    if-eqz v8, :cond_44

    iget-object v7, v4, Landroid/support/v7/widget/GridLayout$LayoutParams;->columnSpec:Landroid/support/v7/widget/GridLayout$Spec;

    .line 1544
    .local v7, "spec":Landroid/support/v7/widget/GridLayout$Spec;
    :goto_2d
    iget-object v6, v7, Landroid/support/v7/widget/GridLayout$Spec;->span:Landroid/support/v7/widget/GridLayout$Interval;

    .line 1545
    .local v6, "span":Landroid/support/v7/widget/GridLayout$Interval;
    if-eqz p1, :cond_47

    iget v3, v6, Landroid/support/v7/widget/GridLayout$Interval;->min:I

    .line 1546
    .local v3, "index":I
    :goto_33
    aget v8, v5, v3

    iget-object v9, p0, Landroid/support/v7/widget/GridLayout$Axis;->this$0:Landroid/support/v7/widget/GridLayout;

    iget-boolean v10, p0, Landroid/support/v7/widget/GridLayout$Axis;->horizontal:Z

    invoke-virtual {v9, v1, v10, p1}, Landroid/support/v7/widget/GridLayout;->getMargin1(Landroid/view/View;ZZ)I

    move-result v9

    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    move-result v8

    aput v8, v5, v3

    goto :goto_1b

    .line 1543
    .end local v3    # "index":I
    .end local v6    # "span":Landroid/support/v7/widget/GridLayout$Interval;
    .end local v7    # "spec":Landroid/support/v7/widget/GridLayout$Spec;
    :cond_44
    iget-object v7, v4, Landroid/support/v7/widget/GridLayout$LayoutParams;->rowSpec:Landroid/support/v7/widget/GridLayout$Spec;

    goto :goto_2d

    .line 1545
    .restart local v6    # "span":Landroid/support/v7/widget/GridLayout$Interval;
    .restart local v7    # "spec":Landroid/support/v7/widget/GridLayout$Spec;
    :cond_47
    iget v3, v6, Landroid/support/v7/widget/GridLayout$Interval;->max:I

    goto :goto_33

    .line 1548
    .end local v1    # "c":Landroid/view/View;
    .end local v4    # "lp":Landroid/support/v7/widget/GridLayout$LayoutParams;
    .end local v6    # "span":Landroid/support/v7/widget/GridLayout$Interval;
    .end local v7    # "spec":Landroid/support/v7/widget/GridLayout$Spec;
    :cond_4a
    return-void
.end method

.method private createArcs()[Landroid/support/v7/widget/GridLayout$Arc;
    .registers 10

    .prologue
    const/4 v8, 0x0

    .line 1353
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 1354
    .local v3, "mins":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/widget/GridLayout$Arc;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1357
    .local v2, "maxs":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/widget/GridLayout$Arc;>;"
    invoke-direct {p0}, Landroid/support/v7/widget/GridLayout$Axis;->getForwardLinks()Landroid/support/v7/widget/GridLayout$PackedMap;

    move-result-object v6

    invoke-direct {p0, v3, v6}, Landroid/support/v7/widget/GridLayout$Axis;->addComponentSizes(Ljava/util/List;Landroid/support/v7/widget/GridLayout$PackedMap;)V

    .line 1359
    invoke-direct {p0}, Landroid/support/v7/widget/GridLayout$Axis;->getBackwardLinks()Landroid/support/v7/widget/GridLayout$PackedMap;

    move-result-object v6

    invoke-direct {p0, v2, v6}, Landroid/support/v7/widget/GridLayout$Axis;->addComponentSizes(Ljava/util/List;Landroid/support/v7/widget/GridLayout$PackedMap;)V

    .line 1362
    iget-boolean v6, p0, Landroid/support/v7/widget/GridLayout$Axis;->orderPreserved:Z

    if-eqz v6, :cond_36

    .line 1364
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1e
    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayout$Axis;->getCount()I

    move-result v6

    if-ge v1, v6, :cond_36

    .line 1365
    new-instance v6, Landroid/support/v7/widget/GridLayout$Interval;

    add-int/lit8 v7, v1, 0x1

    invoke-direct {v6, v1, v7}, Landroid/support/v7/widget/GridLayout$Interval;-><init>(II)V

    new-instance v7, Landroid/support/v7/widget/GridLayout$MutableInt;

    invoke-direct {v7, v8}, Landroid/support/v7/widget/GridLayout$MutableInt;-><init>(I)V

    invoke-direct {p0, v3, v6, v7}, Landroid/support/v7/widget/GridLayout$Axis;->include(Ljava/util/List;Landroid/support/v7/widget/GridLayout$Interval;Landroid/support/v7/widget/GridLayout$MutableInt;)V

    .line 1364
    add-int/lit8 v1, v1, 0x1

    goto :goto_1e

    .line 1371
    .end local v1    # "i":I
    :cond_36
    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayout$Axis;->getCount()I

    move-result v0

    .line 1372
    .local v0, "N":I
    new-instance v6, Landroid/support/v7/widget/GridLayout$Interval;

    invoke-direct {v6, v8, v0}, Landroid/support/v7/widget/GridLayout$Interval;-><init>(II)V

    iget-object v7, p0, Landroid/support/v7/widget/GridLayout$Axis;->parentMin:Landroid/support/v7/widget/GridLayout$MutableInt;

    invoke-direct {p0, v3, v6, v7, v8}, Landroid/support/v7/widget/GridLayout$Axis;->include(Ljava/util/List;Landroid/support/v7/widget/GridLayout$Interval;Landroid/support/v7/widget/GridLayout$MutableInt;Z)V

    .line 1373
    new-instance v6, Landroid/support/v7/widget/GridLayout$Interval;

    invoke-direct {v6, v0, v8}, Landroid/support/v7/widget/GridLayout$Interval;-><init>(II)V

    iget-object v7, p0, Landroid/support/v7/widget/GridLayout$Axis;->parentMax:Landroid/support/v7/widget/GridLayout$MutableInt;

    invoke-direct {p0, v2, v6, v7, v8}, Landroid/support/v7/widget/GridLayout$Axis;->include(Ljava/util/List;Landroid/support/v7/widget/GridLayout$Interval;Landroid/support/v7/widget/GridLayout$MutableInt;Z)V

    .line 1376
    invoke-direct {p0, v3}, Landroid/support/v7/widget/GridLayout$Axis;->topologicalSort(Ljava/util/List;)[Landroid/support/v7/widget/GridLayout$Arc;

    move-result-object v5

    .line 1377
    .local v5, "sMins":[Landroid/support/v7/widget/GridLayout$Arc;
    invoke-direct {p0, v2}, Landroid/support/v7/widget/GridLayout$Axis;->topologicalSort(Ljava/util/List;)[Landroid/support/v7/widget/GridLayout$Arc;

    move-result-object v4

    .line 1379
    .local v4, "sMaxs":[Landroid/support/v7/widget/GridLayout$Arc;
    invoke-static {v5, v4}, Landroid/support/v7/widget/GridLayout;->append([Ljava/lang/Object;[Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Landroid/support/v7/widget/GridLayout$Arc;

    return-object v6
.end method

.method private createGroupBounds()Landroid/support/v7/widget/GridLayout$PackedMap;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/support/v7/widget/GridLayout$PackedMap",
            "<",
            "Landroid/support/v7/widget/GridLayout$Spec;",
            "Landroid/support/v7/widget/GridLayout$Bounds;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1169
    const-class v7, Landroid/support/v7/widget/GridLayout$Spec;

    const-class v8, Landroid/support/v7/widget/GridLayout$Bounds;

    invoke-static {v7, v8}, Landroid/support/v7/widget/GridLayout$Assoc;->of(Ljava/lang/Class;Ljava/lang/Class;)Landroid/support/v7/widget/GridLayout$Assoc;

    move-result-object v1

    .line 1170
    .local v1, "assoc":Landroid/support/v7/widget/GridLayout$Assoc;, "Landroid/support/v7/widget/GridLayout$Assoc<Landroid/support/v7/widget/GridLayout$Spec;Landroid/support/v7/widget/GridLayout$Bounds;>;"
    const/4 v4, 0x0

    .local v4, "i":I
    iget-object v7, p0, Landroid/support/v7/widget/GridLayout$Axis;->this$0:Landroid/support/v7/widget/GridLayout;

    invoke-virtual {v7}, Landroid/support/v7/widget/GridLayout;->getChildCount()I

    move-result v0

    .local v0, "N":I
    :goto_f
    if-ge v4, v0, :cond_3a

    .line 1171
    iget-object v7, p0, Landroid/support/v7/widget/GridLayout$Axis;->this$0:Landroid/support/v7/widget/GridLayout;

    invoke-virtual {v7, v4}, Landroid/support/v7/widget/GridLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 1172
    .local v3, "c":Landroid/view/View;
    iget-object v7, p0, Landroid/support/v7/widget/GridLayout$Axis;->this$0:Landroid/support/v7/widget/GridLayout;

    invoke-virtual {v7, v3}, Landroid/support/v7/widget/GridLayout;->getLayoutParams(Landroid/view/View;)Landroid/support/v7/widget/GridLayout$LayoutParams;

    move-result-object v5

    .line 1173
    .local v5, "lp":Landroid/support/v7/widget/GridLayout$LayoutParams;
    iget-boolean v7, p0, Landroid/support/v7/widget/GridLayout$Axis;->horizontal:Z

    if-eqz v7, :cond_37

    iget-object v6, v5, Landroid/support/v7/widget/GridLayout$LayoutParams;->columnSpec:Landroid/support/v7/widget/GridLayout$Spec;

    .line 1174
    .local v6, "spec":Landroid/support/v7/widget/GridLayout$Spec;
    :goto_23
    iget-object v7, p0, Landroid/support/v7/widget/GridLayout$Axis;->this$0:Landroid/support/v7/widget/GridLayout;

    iget-object v8, v6, Landroid/support/v7/widget/GridLayout$Spec;->alignment:Landroid/support/v7/widget/GridLayout$Alignment;

    iget-boolean v9, p0, Landroid/support/v7/widget/GridLayout$Axis;->horizontal:Z

    invoke-virtual {v7, v8, v9}, Landroid/support/v7/widget/GridLayout;->getAlignment(Landroid/support/v7/widget/GridLayout$Alignment;Z)Landroid/support/v7/widget/GridLayout$Alignment;

    move-result-object v7

    invoke-virtual {v7}, Landroid/support/v7/widget/GridLayout$Alignment;->getBounds()Landroid/support/v7/widget/GridLayout$Bounds;

    move-result-object v2

    .line 1175
    .local v2, "bounds":Landroid/support/v7/widget/GridLayout$Bounds;
    invoke-virtual {v1, v6, v2}, Landroid/support/v7/widget/GridLayout$Assoc;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1170
    add-int/lit8 v4, v4, 0x1

    goto :goto_f

    .line 1173
    .end local v2    # "bounds":Landroid/support/v7/widget/GridLayout$Bounds;
    .end local v6    # "spec":Landroid/support/v7/widget/GridLayout$Spec;
    :cond_37
    iget-object v6, v5, Landroid/support/v7/widget/GridLayout$LayoutParams;->rowSpec:Landroid/support/v7/widget/GridLayout$Spec;

    goto :goto_23

    .line 1177
    .end local v3    # "c":Landroid/view/View;
    .end local v5    # "lp":Landroid/support/v7/widget/GridLayout$LayoutParams;
    :cond_3a
    invoke-virtual {v1}, Landroid/support/v7/widget/GridLayout$Assoc;->pack()Landroid/support/v7/widget/GridLayout$PackedMap;

    move-result-object v7

    return-object v7
.end method

.method private createLinks(Z)Landroid/support/v7/widget/GridLayout$PackedMap;
    .registers 9
    .param p1, "min"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Landroid/support/v7/widget/GridLayout$PackedMap",
            "<",
            "Landroid/support/v7/widget/GridLayout$Interval;",
            "Landroid/support/v7/widget/GridLayout$MutableInt;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1206
    const-class v5, Landroid/support/v7/widget/GridLayout$Interval;

    const-class v6, Landroid/support/v7/widget/GridLayout$MutableInt;

    invoke-static {v5, v6}, Landroid/support/v7/widget/GridLayout$Assoc;->of(Ljava/lang/Class;Ljava/lang/Class;)Landroid/support/v7/widget/GridLayout$Assoc;

    move-result-object v3

    .line 1207
    .local v3, "result":Landroid/support/v7/widget/GridLayout$Assoc;, "Landroid/support/v7/widget/GridLayout$Assoc<Landroid/support/v7/widget/GridLayout$Interval;Landroid/support/v7/widget/GridLayout$MutableInt;>;"
    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayout$Axis;->getGroupBounds()Landroid/support/v7/widget/GridLayout$PackedMap;

    move-result-object v5

    iget-object v2, v5, Landroid/support/v7/widget/GridLayout$PackedMap;->keys:[Ljava/lang/Object;

    check-cast v2, [Landroid/support/v7/widget/GridLayout$Spec;

    .line 1208
    .local v2, "keys":[Landroid/support/v7/widget/GridLayout$Spec;
    const/4 v1, 0x0

    .local v1, "i":I
    array-length v0, v2

    .local v0, "N":I
    :goto_12
    if-ge v1, v0, :cond_2e

    .line 1209
    if-eqz p1, :cond_25

    aget-object v5, v2, v1

    iget-object v4, v5, Landroid/support/v7/widget/GridLayout$Spec;->span:Landroid/support/v7/widget/GridLayout$Interval;

    .line 1210
    .local v4, "span":Landroid/support/v7/widget/GridLayout$Interval;
    :goto_1a
    new-instance v5, Landroid/support/v7/widget/GridLayout$MutableInt;

    invoke-direct {v5}, Landroid/support/v7/widget/GridLayout$MutableInt;-><init>()V

    invoke-virtual {v3, v4, v5}, Landroid/support/v7/widget/GridLayout$Assoc;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1208
    add-int/lit8 v1, v1, 0x1

    goto :goto_12

    .line 1209
    .end local v4    # "span":Landroid/support/v7/widget/GridLayout$Interval;
    :cond_25
    aget-object v5, v2, v1

    iget-object v5, v5, Landroid/support/v7/widget/GridLayout$Spec;->span:Landroid/support/v7/widget/GridLayout$Interval;

    invoke-virtual {v5}, Landroid/support/v7/widget/GridLayout$Interval;->inverse()Landroid/support/v7/widget/GridLayout$Interval;

    move-result-object v4

    goto :goto_1a

    .line 1212
    :cond_2e
    invoke-virtual {v3}, Landroid/support/v7/widget/GridLayout$Assoc;->pack()Landroid/support/v7/widget/GridLayout$PackedMap;

    move-result-object v5

    return-object v5
.end method

.method private getBackwardLinks()Landroid/support/v7/widget/GridLayout$PackedMap;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/support/v7/widget/GridLayout$PackedMap",
            "<",
            "Landroid/support/v7/widget/GridLayout$Interval;",
            "Landroid/support/v7/widget/GridLayout$MutableInt;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 1243
    iget-object v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->backwardLinks:Landroid/support/v7/widget/GridLayout$PackedMap;

    if-nez v0, :cond_b

    .line 1244
    invoke-direct {p0, v1}, Landroid/support/v7/widget/GridLayout$Axis;->createLinks(Z)Landroid/support/v7/widget/GridLayout$PackedMap;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->backwardLinks:Landroid/support/v7/widget/GridLayout$PackedMap;

    .line 1246
    :cond_b
    iget-boolean v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->backwardLinksValid:Z

    if-nez v0, :cond_17

    .line 1247
    iget-object v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->backwardLinks:Landroid/support/v7/widget/GridLayout$PackedMap;

    invoke-direct {p0, v0, v1}, Landroid/support/v7/widget/GridLayout$Axis;->computeLinks(Landroid/support/v7/widget/GridLayout$PackedMap;Z)V

    .line 1248
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->backwardLinksValid:Z

    .line 1250
    :cond_17
    iget-object v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->backwardLinks:Landroid/support/v7/widget/GridLayout$PackedMap;

    return-object v0
.end method

.method private getForwardLinks()Landroid/support/v7/widget/GridLayout$PackedMap;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/support/v7/widget/GridLayout$PackedMap",
            "<",
            "Landroid/support/v7/widget/GridLayout$Interval;",
            "Landroid/support/v7/widget/GridLayout$MutableInt;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 1232
    iget-object v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->forwardLinks:Landroid/support/v7/widget/GridLayout$PackedMap;

    if-nez v0, :cond_b

    .line 1233
    invoke-direct {p0, v1}, Landroid/support/v7/widget/GridLayout$Axis;->createLinks(Z)Landroid/support/v7/widget/GridLayout$PackedMap;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->forwardLinks:Landroid/support/v7/widget/GridLayout$PackedMap;

    .line 1235
    :cond_b
    iget-boolean v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->forwardLinksValid:Z

    if-nez v0, :cond_16

    .line 1236
    iget-object v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->forwardLinks:Landroid/support/v7/widget/GridLayout$PackedMap;

    invoke-direct {p0, v0, v1}, Landroid/support/v7/widget/GridLayout$Axis;->computeLinks(Landroid/support/v7/widget/GridLayout$PackedMap;Z)V

    .line 1237
    iput-boolean v1, p0, Landroid/support/v7/widget/GridLayout$Axis;->forwardLinksValid:Z

    .line 1239
    :cond_16
    iget-object v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->forwardLinks:Landroid/support/v7/widget/GridLayout$PackedMap;

    return-object v0
.end method

.method private getMaxIndex()I
    .registers 3

    .prologue
    .line 1145
    iget v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->maxIndex:I

    const/high16 v1, -0x80000000

    if-ne v0, v1, :cond_11

    .line 1146
    const/4 v0, 0x0

    invoke-direct {p0}, Landroid/support/v7/widget/GridLayout$Axis;->calculateMaxIndex()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->maxIndex:I

    .line 1148
    :cond_11
    iget v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->maxIndex:I

    return v0
.end method

.method private getMeasure(II)I
    .registers 4
    .param p1, "min"    # I
    .param p2, "max"    # I

    .prologue
    .line 1616
    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/GridLayout$Axis;->setParentConstraints(II)V

    .line 1617
    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayout$Axis;->getLocations()[I

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/support/v7/widget/GridLayout$Axis;->size([I)I

    move-result v0

    return v0
.end method

.method private include(Ljava/util/List;Landroid/support/v7/widget/GridLayout$Interval;Landroid/support/v7/widget/GridLayout$MutableInt;)V
    .registers 5
    .param p2, "key"    # Landroid/support/v7/widget/GridLayout$Interval;
    .param p3, "size"    # Landroid/support/v7/widget/GridLayout$MutableInt;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/widget/GridLayout$Arc;",
            ">;",
            "Landroid/support/v7/widget/GridLayout$Interval;",
            "Landroid/support/v7/widget/GridLayout$MutableInt;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1278
    .local p1, "arcs":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/widget/GridLayout$Arc;>;"
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, p3, v0}, Landroid/support/v7/widget/GridLayout$Axis;->include(Ljava/util/List;Landroid/support/v7/widget/GridLayout$Interval;Landroid/support/v7/widget/GridLayout$MutableInt;Z)V

    .line 1279
    return-void
.end method

.method private include(Ljava/util/List;Landroid/support/v7/widget/GridLayout$Interval;Landroid/support/v7/widget/GridLayout$MutableInt;Z)V
    .registers 9
    .param p2, "key"    # Landroid/support/v7/widget/GridLayout$Interval;
    .param p3, "size"    # Landroid/support/v7/widget/GridLayout$MutableInt;
    .param p4, "ignoreIfAlreadyPresent"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/widget/GridLayout$Arc;",
            ">;",
            "Landroid/support/v7/widget/GridLayout$Interval;",
            "Landroid/support/v7/widget/GridLayout$MutableInt;",
            "Z)V"
        }
    .end annotation

    .prologue
    .line 1261
    .local p1, "arcs":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/widget/GridLayout$Arc;>;"
    invoke-virtual {p2}, Landroid/support/v7/widget/GridLayout$Interval;->size()I

    move-result v3

    if-nez v3, :cond_7

    .line 1275
    :goto_6
    return-void

    .line 1266
    :cond_7
    if-eqz p4, :cond_22

    .line 1267
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_22

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/GridLayout$Arc;

    .line 1268
    .local v0, "arc":Landroid/support/v7/widget/GridLayout$Arc;
    iget-object v2, v0, Landroid/support/v7/widget/GridLayout$Arc;->span:Landroid/support/v7/widget/GridLayout$Interval;

    .line 1269
    .local v2, "span":Landroid/support/v7/widget/GridLayout$Interval;
    invoke-virtual {v2, p2}, Landroid/support/v7/widget/GridLayout$Interval;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_d

    goto :goto_6

    .line 1274
    .end local v0    # "arc":Landroid/support/v7/widget/GridLayout$Arc;
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "span":Landroid/support/v7/widget/GridLayout$Interval;
    :cond_22
    new-instance v3, Landroid/support/v7/widget/GridLayout$Arc;

    invoke-direct {v3, p2, p3}, Landroid/support/v7/widget/GridLayout$Arc;-><init>(Landroid/support/v7/widget/GridLayout$Interval;Landroid/support/v7/widget/GridLayout$MutableInt;)V

    invoke-interface {p1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_6
.end method

.method private init([I)V
    .registers 3
    .param p1, "locations"    # [I

    .prologue
    .line 1416
    const/4 v0, 0x0

    invoke-static {p1, v0}, Ljava/util/Arrays;->fill([II)V

    .line 1417
    return-void
.end method

.method private logError(Ljava/lang/String;[Landroid/support/v7/widget/GridLayout$Arc;[Z)V
    .registers 11
    .param p1, "axisName"    # Ljava/lang/String;
    .param p2, "arcs"    # [Landroid/support/v7/widget/GridLayout$Arc;
    .param p3, "culprits0"    # [Z

    .prologue
    .line 1441
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1442
    .local v2, "culprits":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/widget/GridLayout$Arc;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 1443
    .local v3, "removed":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/widget/GridLayout$Arc;>;"
    const/4 v1, 0x0

    .local v1, "c":I
    :goto_b
    array-length v4, p2

    if-ge v1, v4, :cond_21

    .line 1444
    aget-object v0, p2, v1

    .line 1445
    .local v0, "arc":Landroid/support/v7/widget/GridLayout$Arc;
    aget-boolean v4, p3, v1

    if-eqz v4, :cond_17

    .line 1446
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1448
    :cond_17
    iget-boolean v4, v0, Landroid/support/v7/widget/GridLayout$Arc;->valid:Z

    if-nez v4, :cond_1e

    .line 1449
    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1443
    :cond_1e
    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    .line 1452
    .end local v0    # "arc":Landroid/support/v7/widget/GridLayout$Arc;
    :cond_21
    sget-object v4, Landroid/support/v7/widget/GridLayout;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " constraints: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-direct {p0, v2}, Landroid/support/v7/widget/GridLayout$Axis;->arcsToString(Ljava/util/List;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " are inconsistent; "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "permanently removing: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-direct {p0, v3}, Landroid/support/v7/widget/GridLayout$Axis;->arcsToString(Ljava/util/List;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ". "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1454
    return-void
.end method

.method private relax([ILandroid/support/v7/widget/GridLayout$Arc;)Z
    .registers 10
    .param p1, "locations"    # [I
    .param p2, "entry"    # Landroid/support/v7/widget/GridLayout$Arc;

    .prologue
    const/4 v5, 0x0

    .line 1400
    iget-boolean v6, p2, Landroid/support/v7/widget/GridLayout$Arc;->valid:Z

    if-nez v6, :cond_6

    .line 1412
    :cond_5
    :goto_5
    return v5

    .line 1403
    :cond_6
    iget-object v1, p2, Landroid/support/v7/widget/GridLayout$Arc;->span:Landroid/support/v7/widget/GridLayout$Interval;

    .line 1404
    .local v1, "span":Landroid/support/v7/widget/GridLayout$Interval;
    iget v2, v1, Landroid/support/v7/widget/GridLayout$Interval;->min:I

    .line 1405
    .local v2, "u":I
    iget v3, v1, Landroid/support/v7/widget/GridLayout$Interval;->max:I

    .line 1406
    .local v3, "v":I
    iget-object v6, p2, Landroid/support/v7/widget/GridLayout$Arc;->value:Landroid/support/v7/widget/GridLayout$MutableInt;

    iget v4, v6, Landroid/support/v7/widget/GridLayout$MutableInt;->value:I

    .line 1407
    .local v4, "value":I
    aget v6, p1, v2

    add-int v0, v6, v4

    .line 1408
    .local v0, "candidate":I
    aget v6, p1, v3

    if-le v0, v6, :cond_5

    .line 1409
    aput v0, p1, v3

    .line 1410
    const/4 v5, 0x1

    goto :goto_5
.end method

.method private setParentConstraints(II)V
    .registers 5
    .param p1, "min"    # I
    .param p2, "max"    # I

    .prologue
    .line 1610
    iget-object v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->parentMin:Landroid/support/v7/widget/GridLayout$MutableInt;

    iput p1, v0, Landroid/support/v7/widget/GridLayout$MutableInt;->value:I

    .line 1611
    iget-object v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->parentMax:Landroid/support/v7/widget/GridLayout$MutableInt;

    neg-int v1, p2

    iput v1, v0, Landroid/support/v7/widget/GridLayout$MutableInt;->value:I

    .line 1612
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->locationsValid:Z

    .line 1613
    return-void
.end method

.method private size([I)I
    .registers 3
    .param p1, "locations"    # [I

    .prologue
    .line 1606
    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayout$Axis;->getCount()I

    move-result v0

    aget v0, p1, v0

    return v0
.end method

.method private solve([Landroid/support/v7/widget/GridLayout$Arc;[I)V
    .registers 15
    .param p1, "arcs"    # [Landroid/support/v7/widget/GridLayout$Arc;
    .param p2, "locations"    # [I

    .prologue
    .line 1491
    iget-boolean v10, p0, Landroid/support/v7/widget/GridLayout$Axis;->horizontal:Z

    if-eqz v10, :cond_26

    const-string v2, "horizontal"

    .line 1492
    .local v2, "axisName":Ljava/lang/String;
    :goto_6
    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayout$Axis;->getCount()I

    move-result v10

    add-int/lit8 v0, v10, 0x1

    .line 1493
    .local v0, "N":I
    const/4 v8, 0x0

    .line 1495
    .local v8, "originalCulprits":[Z
    const/4 v9, 0x0

    .local v9, "p":I
    :goto_e
    array-length v10, p1

    if-ge v9, v10, :cond_30

    .line 1496
    invoke-direct {p0, p2}, Landroid/support/v7/widget/GridLayout$Axis;->init([I)V

    .line 1499
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_15
    if-ge v5, v0, :cond_34

    .line 1500
    const/4 v3, 0x0

    .line 1501
    .local v3, "changed":Z
    const/4 v6, 0x0

    .local v6, "j":I
    array-length v7, p1

    .local v7, "length":I
    :goto_1a
    if-ge v6, v7, :cond_29

    .line 1502
    aget-object v10, p1, v6

    invoke-direct {p0, p2, v10}, Landroid/support/v7/widget/GridLayout$Axis;->relax([ILandroid/support/v7/widget/GridLayout$Arc;)Z

    move-result v10

    or-int/2addr v3, v10

    .line 1501
    add-int/lit8 v6, v6, 0x1

    goto :goto_1a

    .line 1491
    .end local v0    # "N":I
    .end local v2    # "axisName":Ljava/lang/String;
    .end local v3    # "changed":Z
    .end local v5    # "i":I
    .end local v6    # "j":I
    .end local v7    # "length":I
    .end local v8    # "originalCulprits":[Z
    .end local v9    # "p":I
    :cond_26
    const-string v2, "vertical"

    goto :goto_6

    .line 1504
    .restart local v0    # "N":I
    .restart local v2    # "axisName":Ljava/lang/String;
    .restart local v3    # "changed":Z
    .restart local v5    # "i":I
    .restart local v6    # "j":I
    .restart local v7    # "length":I
    .restart local v8    # "originalCulprits":[Z
    .restart local v9    # "p":I
    :cond_29
    if-nez v3, :cond_31

    .line 1505
    if-eqz v8, :cond_30

    .line 1506
    invoke-direct {p0, v2, p1, v8}, Landroid/support/v7/widget/GridLayout$Axis;->logError(Ljava/lang/String;[Landroid/support/v7/widget/GridLayout$Arc;[Z)V

    .line 1535
    .end local v3    # "changed":Z
    .end local v5    # "i":I
    .end local v6    # "j":I
    .end local v7    # "length":I
    :cond_30
    return-void

    .line 1499
    .restart local v3    # "changed":Z
    .restart local v5    # "i":I
    .restart local v6    # "j":I
    .restart local v7    # "length":I
    :cond_31
    add-int/lit8 v5, v5, 0x1

    goto :goto_15

    .line 1512
    .end local v3    # "changed":Z
    .end local v6    # "j":I
    .end local v7    # "length":I
    :cond_34
    array-length v10, p1

    new-array v4, v10, [Z

    .line 1513
    .local v4, "culprits":[Z
    const/4 v5, 0x0

    :goto_38
    if-ge v5, v0, :cond_4f

    .line 1514
    const/4 v6, 0x0

    .restart local v6    # "j":I
    array-length v7, p1

    .restart local v7    # "length":I
    :goto_3c
    if-ge v6, v7, :cond_4c

    .line 1515
    aget-boolean v10, v4, v6

    aget-object v11, p1, v6

    invoke-direct {p0, p2, v11}, Landroid/support/v7/widget/GridLayout$Axis;->relax([ILandroid/support/v7/widget/GridLayout$Arc;)Z

    move-result v11

    or-int/2addr v10, v11

    aput-boolean v10, v4, v6

    .line 1514
    add-int/lit8 v6, v6, 0x1

    goto :goto_3c

    .line 1513
    :cond_4c
    add-int/lit8 v5, v5, 0x1

    goto :goto_38

    .line 1519
    .end local v6    # "j":I
    .end local v7    # "length":I
    :cond_4f
    if-nez v9, :cond_52

    .line 1520
    move-object v8, v4

    .line 1523
    :cond_52
    const/4 v5, 0x0

    :goto_53
    array-length v10, p1

    if-ge v5, v10, :cond_6c

    .line 1524
    aget-boolean v10, v4, v5

    if-eqz v10, :cond_66

    .line 1525
    aget-object v1, p1, v5

    .line 1527
    .local v1, "arc":Landroid/support/v7/widget/GridLayout$Arc;
    iget-object v10, v1, Landroid/support/v7/widget/GridLayout$Arc;->span:Landroid/support/v7/widget/GridLayout$Interval;

    iget v10, v10, Landroid/support/v7/widget/GridLayout$Interval;->min:I

    iget-object v11, v1, Landroid/support/v7/widget/GridLayout$Arc;->span:Landroid/support/v7/widget/GridLayout$Interval;

    iget v11, v11, Landroid/support/v7/widget/GridLayout$Interval;->max:I

    if-ge v10, v11, :cond_69

    .line 1523
    .end local v1    # "arc":Landroid/support/v7/widget/GridLayout$Arc;
    :cond_66
    add-int/lit8 v5, v5, 0x1

    goto :goto_53

    .line 1530
    .restart local v1    # "arc":Landroid/support/v7/widget/GridLayout$Arc;
    :cond_69
    const/4 v10, 0x0

    iput-boolean v10, v1, Landroid/support/v7/widget/GridLayout$Arc;->valid:Z

    .line 1495
    .end local v1    # "arc":Landroid/support/v7/widget/GridLayout$Arc;
    :cond_6c
    add-int/lit8 v9, v9, 0x1

    goto :goto_e
.end method

.method private topologicalSort(Ljava/util/List;)[Landroid/support/v7/widget/GridLayout$Arc;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/widget/GridLayout$Arc;",
            ">;)[",
            "Landroid/support/v7/widget/GridLayout$Arc;"
        }
    .end annotation

    .prologue
    .line 1342
    .local p1, "arcs":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/widget/GridLayout$Arc;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Landroid/support/v7/widget/GridLayout$Arc;

    invoke-interface {p1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/support/v7/widget/GridLayout$Arc;

    invoke-direct {p0, v0}, Landroid/support/v7/widget/GridLayout$Axis;->topologicalSort([Landroid/support/v7/widget/GridLayout$Arc;)[Landroid/support/v7/widget/GridLayout$Arc;

    move-result-object v0

    return-object v0
.end method

.method private topologicalSort([Landroid/support/v7/widget/GridLayout$Arc;)[Landroid/support/v7/widget/GridLayout$Arc;
    .registers 3
    .param p1, "arcs"    # [Landroid/support/v7/widget/GridLayout$Arc;

    .prologue
    .line 1304
    new-instance v0, Landroid/support/v7/widget/GridLayout$Axis$1;

    invoke-direct {v0, p0, p1}, Landroid/support/v7/widget/GridLayout$Axis$1;-><init>(Landroid/support/v7/widget/GridLayout$Axis;[Landroid/support/v7/widget/GridLayout$Arc;)V

    invoke-virtual {v0}, Landroid/support/v7/widget/GridLayout$Axis$1;->sort()[Landroid/support/v7/widget/GridLayout$Arc;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getArcs()[Landroid/support/v7/widget/GridLayout$Arc;
    .registers 2

    .prologue
    .line 1389
    iget-object v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->arcs:[Landroid/support/v7/widget/GridLayout$Arc;

    if-nez v0, :cond_a

    .line 1390
    invoke-direct {p0}, Landroid/support/v7/widget/GridLayout$Axis;->createArcs()[Landroid/support/v7/widget/GridLayout$Arc;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->arcs:[Landroid/support/v7/widget/GridLayout$Arc;

    .line 1392
    :cond_a
    iget-boolean v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->arcsValid:Z

    if-nez v0, :cond_14

    .line 1393
    invoke-direct {p0}, Landroid/support/v7/widget/GridLayout$Axis;->computeArcs()V

    .line 1394
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->arcsValid:Z

    .line 1396
    :cond_14
    iget-object v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->arcs:[Landroid/support/v7/widget/GridLayout$Arc;

    return-object v0
.end method

.method public getCount()I
    .registers 3

    .prologue
    .line 1152
    iget v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->definedCount:I

    invoke-direct {p0}, Landroid/support/v7/widget/GridLayout$Axis;->getMaxIndex()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method public getGroupBounds()Landroid/support/v7/widget/GridLayout$PackedMap;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/support/v7/widget/GridLayout$PackedMap",
            "<",
            "Landroid/support/v7/widget/GridLayout$Spec;",
            "Landroid/support/v7/widget/GridLayout$Bounds;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1194
    iget-object v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->groupBounds:Landroid/support/v7/widget/GridLayout$PackedMap;

    if-nez v0, :cond_a

    .line 1195
    invoke-direct {p0}, Landroid/support/v7/widget/GridLayout$Axis;->createGroupBounds()Landroid/support/v7/widget/GridLayout$PackedMap;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->groupBounds:Landroid/support/v7/widget/GridLayout$PackedMap;

    .line 1197
    :cond_a
    iget-boolean v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->groupBoundsValid:Z

    if-nez v0, :cond_14

    .line 1198
    invoke-direct {p0}, Landroid/support/v7/widget/GridLayout$Axis;->computeGroupBounds()V

    .line 1199
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->groupBoundsValid:Z

    .line 1201
    :cond_14
    iget-object v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->groupBounds:Landroid/support/v7/widget/GridLayout$PackedMap;

    return-object v0
.end method

.method public getLeadingMargins()[I
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 1553
    iget-object v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->leadingMargins:[I

    if-nez v0, :cond_f

    .line 1554
    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayout$Axis;->getCount()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    new-array v0, v0, [I

    iput-object v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->leadingMargins:[I

    .line 1556
    :cond_f
    iget-boolean v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->leadingMarginsValid:Z

    if-nez v0, :cond_18

    .line 1557
    invoke-direct {p0, v1}, Landroid/support/v7/widget/GridLayout$Axis;->computeMargins(Z)V

    .line 1558
    iput-boolean v1, p0, Landroid/support/v7/widget/GridLayout$Axis;->leadingMarginsValid:Z

    .line 1560
    :cond_18
    iget-object v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->leadingMargins:[I

    return-object v0
.end method

.method public getLocations()[I
    .registers 3

    .prologue
    .line 1591
    iget-object v1, p0, Landroid/support/v7/widget/GridLayout$Axis;->locations:[I

    if-nez v1, :cond_e

    .line 1592
    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayout$Axis;->getCount()I

    move-result v1

    add-int/lit8 v0, v1, 0x1

    .line 1593
    .local v0, "N":I
    new-array v1, v0, [I

    iput-object v1, p0, Landroid/support/v7/widget/GridLayout$Axis;->locations:[I

    .line 1595
    .end local v0    # "N":I
    :cond_e
    iget-boolean v1, p0, Landroid/support/v7/widget/GridLayout$Axis;->locationsValid:Z

    if-nez v1, :cond_1a

    .line 1596
    iget-object v1, p0, Landroid/support/v7/widget/GridLayout$Axis;->locations:[I

    invoke-direct {p0, v1}, Landroid/support/v7/widget/GridLayout$Axis;->computeLocations([I)V

    .line 1597
    const/4 v1, 0x1

    iput-boolean v1, p0, Landroid/support/v7/widget/GridLayout$Axis;->locationsValid:Z

    .line 1599
    :cond_1a
    iget-object v1, p0, Landroid/support/v7/widget/GridLayout$Axis;->locations:[I

    return-object v1
.end method

.method public getMeasure(I)I
    .registers 6
    .param p1, "measureSpec"    # I

    .prologue
    const/4 v2, 0x0

    .line 1621
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    .line 1622
    .local v0, "mode":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    .line 1623
    .local v1, "size":I
    sparse-switch v0, :sswitch_data_28

    .line 1634
    sget-boolean v3, Landroid/support/v7/widget/GridLayout$Axis;->$assertionsDisabled:Z

    if-nez v3, :cond_1d

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 1625
    :sswitch_16
    const v3, 0x186a0

    invoke-direct {p0, v2, v3}, Landroid/support/v7/widget/GridLayout$Axis;->getMeasure(II)I

    move-result v2

    .line 1635
    :cond_1d
    :goto_1d
    return v2

    .line 1628
    :sswitch_1e
    invoke-direct {p0, v1, v1}, Landroid/support/v7/widget/GridLayout$Axis;->getMeasure(II)I

    move-result v2

    goto :goto_1d

    .line 1631
    :sswitch_23
    invoke-direct {p0, v2, v1}, Landroid/support/v7/widget/GridLayout$Axis;->getMeasure(II)I

    move-result v2

    goto :goto_1d

    .line 1623
    :sswitch_data_28
    .sparse-switch
        -0x80000000 -> :sswitch_23
        0x0 -> :sswitch_16
        0x40000000 -> :sswitch_1e
    .end sparse-switch
.end method

.method public getTrailingMargins()[I
    .registers 2

    .prologue
    .line 1564
    iget-object v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->trailingMargins:[I

    if-nez v0, :cond_e

    .line 1565
    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayout$Axis;->getCount()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    new-array v0, v0, [I

    iput-object v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->trailingMargins:[I

    .line 1567
    :cond_e
    iget-boolean v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->trailingMarginsValid:Z

    if-nez v0, :cond_19

    .line 1568
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroid/support/v7/widget/GridLayout$Axis;->computeMargins(Z)V

    .line 1569
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->trailingMarginsValid:Z

    .line 1571
    :cond_19
    iget-object v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->trailingMargins:[I

    return-object v0
.end method

.method groupArcsByFirstVertex([Landroid/support/v7/widget/GridLayout$Arc;)[[Landroid/support/v7/widget/GridLayout$Arc;
    .registers 13
    .param p1, "arcs"    # [Landroid/support/v7/widget/GridLayout$Arc;

    .prologue
    .line 1284
    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayout$Axis;->getCount()I

    move-result v8

    add-int/lit8 v0, v8, 0x1

    .line 1285
    .local v0, "N":I
    new-array v6, v0, [[Landroid/support/v7/widget/GridLayout$Arc;

    .line 1286
    .local v6, "result":[[Landroid/support/v7/widget/GridLayout$Arc;
    new-array v7, v0, [I

    .line 1287
    .local v7, "sizes":[I
    move-object v2, p1

    .local v2, "arr$":[Landroid/support/v7/widget/GridLayout$Arc;
    array-length v5, v2

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_d
    if-ge v4, v5, :cond_1e

    aget-object v1, v2, v4

    .line 1288
    .local v1, "arc":Landroid/support/v7/widget/GridLayout$Arc;
    iget-object v8, v1, Landroid/support/v7/widget/GridLayout$Arc;->span:Landroid/support/v7/widget/GridLayout$Interval;

    iget v8, v8, Landroid/support/v7/widget/GridLayout$Interval;->min:I

    aget v9, v7, v8

    add-int/lit8 v9, v9, 0x1

    aput v9, v7, v8

    .line 1287
    add-int/lit8 v4, v4, 0x1

    goto :goto_d

    .line 1290
    .end local v1    # "arc":Landroid/support/v7/widget/GridLayout$Arc;
    :cond_1e
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1f
    array-length v8, v7

    if-ge v3, v8, :cond_2b

    .line 1291
    aget v8, v7, v3

    new-array v8, v8, [Landroid/support/v7/widget/GridLayout$Arc;

    aput-object v8, v6, v3

    .line 1290
    add-int/lit8 v3, v3, 0x1

    goto :goto_1f

    .line 1294
    :cond_2b
    const/4 v8, 0x0

    invoke-static {v7, v8}, Ljava/util/Arrays;->fill([II)V

    .line 1295
    move-object v2, p1

    array-length v5, v2

    const/4 v4, 0x0

    :goto_32
    if-ge v4, v5, :cond_47

    aget-object v1, v2, v4

    .line 1296
    .restart local v1    # "arc":Landroid/support/v7/widget/GridLayout$Arc;
    iget-object v8, v1, Landroid/support/v7/widget/GridLayout$Arc;->span:Landroid/support/v7/widget/GridLayout$Interval;

    iget v3, v8, Landroid/support/v7/widget/GridLayout$Interval;->min:I

    .line 1297
    aget-object v8, v6, v3

    aget v9, v7, v3

    add-int/lit8 v10, v9, 0x1

    aput v10, v7, v3

    aput-object v1, v8, v9

    .line 1295
    add-int/lit8 v4, v4, 0x1

    goto :goto_32

    .line 1300
    .end local v1    # "arc":Landroid/support/v7/widget/GridLayout$Arc;
    :cond_47
    return-object v6
.end method

.method public invalidateStructure()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 1646
    const/high16 v0, -0x80000000

    iput v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->maxIndex:I

    .line 1648
    iput-object v1, p0, Landroid/support/v7/widget/GridLayout$Axis;->groupBounds:Landroid/support/v7/widget/GridLayout$PackedMap;

    .line 1649
    iput-object v1, p0, Landroid/support/v7/widget/GridLayout$Axis;->forwardLinks:Landroid/support/v7/widget/GridLayout$PackedMap;

    .line 1650
    iput-object v1, p0, Landroid/support/v7/widget/GridLayout$Axis;->backwardLinks:Landroid/support/v7/widget/GridLayout$PackedMap;

    .line 1652
    iput-object v1, p0, Landroid/support/v7/widget/GridLayout$Axis;->leadingMargins:[I

    .line 1653
    iput-object v1, p0, Landroid/support/v7/widget/GridLayout$Axis;->trailingMargins:[I

    .line 1654
    iput-object v1, p0, Landroid/support/v7/widget/GridLayout$Axis;->arcs:[Landroid/support/v7/widget/GridLayout$Arc;

    .line 1656
    iput-object v1, p0, Landroid/support/v7/widget/GridLayout$Axis;->locations:[I

    .line 1658
    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayout$Axis;->invalidateValues()V

    .line 1659
    return-void
.end method

.method public invalidateValues()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 1662
    iput-boolean v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->groupBoundsValid:Z

    .line 1663
    iput-boolean v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->forwardLinksValid:Z

    .line 1664
    iput-boolean v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->backwardLinksValid:Z

    .line 1666
    iput-boolean v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->leadingMarginsValid:Z

    .line 1667
    iput-boolean v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->trailingMarginsValid:Z

    .line 1668
    iput-boolean v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->arcsValid:Z

    .line 1670
    iput-boolean v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->locationsValid:Z

    .line 1671
    return-void
.end method

.method public isOrderPreserved()Z
    .registers 2

    .prologue
    .line 1160
    iget-boolean v0, p0, Landroid/support/v7/widget/GridLayout$Axis;->orderPreserved:Z

    return v0
.end method

.method public layout(I)V
    .registers 2
    .param p1, "size"    # I

    .prologue
    .line 1641
    invoke-direct {p0, p1, p1}, Landroid/support/v7/widget/GridLayout$Axis;->setParentConstraints(II)V

    .line 1642
    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayout$Axis;->getLocations()[I

    .line 1643
    return-void
.end method

.method public setCount(I)V
    .registers 2
    .param p1, "count"    # I

    .prologue
    .line 1156
    iput p1, p0, Landroid/support/v7/widget/GridLayout$Axis;->definedCount:I

    .line 1157
    return-void
.end method

.method public setOrderPreserved(Z)V
    .registers 2
    .param p1, "orderPreserved"    # Z

    .prologue
    .line 1164
    iput-boolean p1, p0, Landroid/support/v7/widget/GridLayout$Axis;->orderPreserved:Z

    .line 1165
    invoke-virtual {p0}, Landroid/support/v7/widget/GridLayout$Axis;->invalidateStructure()V

    .line 1166
    return-void
.end method
