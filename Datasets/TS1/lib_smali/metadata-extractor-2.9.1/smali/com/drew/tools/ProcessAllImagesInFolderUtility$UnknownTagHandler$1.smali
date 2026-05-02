.class Lcom/drew/tools/ProcessAllImagesInFolderUtility$UnknownTagHandler$1;
.super Ljava/lang/Object;
.source "ProcessAllImagesInFolderUtility.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/drew/tools/ProcessAllImagesInFolderUtility$UnknownTagHandler;->onScanCompleted(Ljava/io/PrintStream;)V
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
        "Ljava/util/Map$Entry",
        "<",
        "Ljava/lang/Integer;",
        "Ljava/lang/Integer;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/drew/tools/ProcessAllImagesInFolderUtility$UnknownTagHandler;


# direct methods
.method constructor <init>(Lcom/drew/tools/ProcessAllImagesInFolderUtility$UnknownTagHandler;)V
    .registers 2

    .prologue
    .line 602
    iput-object p1, p0, Lcom/drew/tools/ProcessAllImagesInFolderUtility$UnknownTagHandler$1;->this$0:Lcom/drew/tools/ProcessAllImagesInFolderUtility$UnknownTagHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 602
    check-cast p1, Ljava/util/Map$Entry;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Ljava/util/Map$Entry;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$UnknownTagHandler$1;->compare(Ljava/util/Map$Entry;Ljava/util/Map$Entry;)I

    move-result v0

    return v0
.end method

.method public compare(Ljava/util/Map$Entry;Ljava/util/Map$Entry;)I
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 605
    .local p1, "o1":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    .local p2, "o2":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/Integer;->compareTo(Ljava/lang/Integer;)I

    move-result v0

    return v0
.end method
