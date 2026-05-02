.class public abstract Lorg/ligi/axt/simplifications/SimpleOnItemSelectedListener;
.super Ljava/lang/Object;
.source "SimpleOnItemSelectedListener.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 11
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    return-void
.end method
