.class Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$2;
.super Ljava/lang/Object;
.source "SimpleSectionedGridAdapter.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;->setSections()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;


# direct methods
.method constructor <init>(Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;)V
    .registers 2

    .prologue
    .line 151
    iput-object p1, p0, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$2;->this$0:Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;)I
    .registers 5
    .param p1, "o"    # Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;
    .param p2, "o1"    # Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;

    .prologue
    .line 154
    iget v0, p1, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;->firstPosition:I

    iget v1, p2, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;->firstPosition:I

    if-ne v0, v1, :cond_8

    const/4 v0, 0x0

    :goto_7
    return v0

    :cond_8
    iget v0, p1, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;->firstPosition:I

    iget v1, p2, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;->firstPosition:I

    if-ge v0, v1, :cond_10

    const/4 v0, -0x1

    goto :goto_7

    :cond_10
    const/4 v0, 0x1

    goto :goto_7
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 151
    check-cast p1, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$2;->compare(Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;Lcom/cocosw/bottomsheet/SimpleSectionedGridAdapter$Section;)I

    move-result v0

    return v0
.end method
