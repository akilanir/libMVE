.class Lcom/afollestad/materialdialogs/progress/CircularProgressDrawable$2;
.super Landroid/util/Property;
.source "CircularProgressDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/afollestad/materialdialogs/progress/CircularProgressDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/util/Property",
        "<",
        "Lcom/afollestad/materialdialogs/progress/CircularProgressDrawable;",
        "Ljava/lang/Float;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/afollestad/materialdialogs/progress/CircularProgressDrawable;


# direct methods
.method constructor <init>(Lcom/afollestad/materialdialogs/progress/CircularProgressDrawable;Ljava/lang/Class;Ljava/lang/String;)V
    .registers 4
    .param p3, "x1"    # Ljava/lang/String;

    .prologue
    .line 160
    .local p2, "x0":Ljava/lang/Class;, "Ljava/lang/Class<Ljava/lang/Float;>;"
    iput-object p1, p0, Lcom/afollestad/materialdialogs/progress/CircularProgressDrawable$2;->this$0:Lcom/afollestad/materialdialogs/progress/CircularProgressDrawable;

    invoke-direct {p0, p2, p3}, Landroid/util/Property;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public get(Lcom/afollestad/materialdialogs/progress/CircularProgressDrawable;)Ljava/lang/Float;
    .registers 3
    .param p1, "object"    # Lcom/afollestad/materialdialogs/progress/CircularProgressDrawable;

    .prologue
    .line 163
    invoke-virtual {p1}, Lcom/afollestad/materialdialogs/progress/CircularProgressDrawable;->getCurrentSweepAngle()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 160
    check-cast p1, Lcom/afollestad/materialdialogs/progress/CircularProgressDrawable;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/afollestad/materialdialogs/progress/CircularProgressDrawable$2;->get(Lcom/afollestad/materialdialogs/progress/CircularProgressDrawable;)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method

.method public set(Lcom/afollestad/materialdialogs/progress/CircularProgressDrawable;Ljava/lang/Float;)V
    .registers 4
    .param p1, "object"    # Lcom/afollestad/materialdialogs/progress/CircularProgressDrawable;
    .param p2, "value"    # Ljava/lang/Float;

    .prologue
    .line 168
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-virtual {p1, v0}, Lcom/afollestad/materialdialogs/progress/CircularProgressDrawable;->setCurrentSweepAngle(F)V

    .line 169
    return-void
.end method

.method public bridge synthetic set(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 160
    check-cast p1, Lcom/afollestad/materialdialogs/progress/CircularProgressDrawable;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Ljava/lang/Float;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/afollestad/materialdialogs/progress/CircularProgressDrawable$2;->set(Lcom/afollestad/materialdialogs/progress/CircularProgressDrawable;Ljava/lang/Float;)V

    return-void
.end method
