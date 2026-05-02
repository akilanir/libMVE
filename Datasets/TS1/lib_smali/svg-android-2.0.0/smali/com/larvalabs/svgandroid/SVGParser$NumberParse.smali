.class Lcom/larvalabs/svgandroid/SVGParser$NumberParse;
.super Ljava/lang/Object;
.source "SVGParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/larvalabs/svgandroid/SVGParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "NumberParse"
.end annotation


# instance fields
.field private nextCmd:I

.field private numbers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/ArrayList;I)V
    .registers 3
    .param p2, "nextCmd"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Float;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 627
    .local p1, "numbers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Float;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 628
    iput-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->numbers:Ljava/util/ArrayList;

    .line 629
    iput p2, p0, Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->nextCmd:I

    .line 630
    return-void
.end method

.method static synthetic access$000(Lcom/larvalabs/svgandroid/SVGParser$NumberParse;)Ljava/util/ArrayList;
    .registers 2
    .param p0, "x0"    # Lcom/larvalabs/svgandroid/SVGParser$NumberParse;

    .prologue
    .line 623
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->numbers:Ljava/util/ArrayList;

    return-object v0
.end method


# virtual methods
.method public getNextCmd()I
    .registers 2

    .prologue
    .line 633
    iget v0, p0, Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->nextCmd:I

    return v0
.end method

.method public getNumber(I)F
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 637
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->numbers:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    return v0
.end method
