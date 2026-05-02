.class Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$FolderSorter;
.super Ljava/lang/Object;
.source "FolderChooserDialog.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FolderSorter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Ljava/io/File;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 221
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$1;)V
    .registers 2
    .param p1, "x0"    # Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$1;

    .prologue
    .line 221
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$FolderSorter;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Ljava/io/File;Ljava/io/File;)I
    .registers 5
    .param p1, "lhs"    # Ljava/io/File;
    .param p2, "rhs"    # Ljava/io/File;

    .prologue
    .line 224
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 221
    check-cast p1, Ljava/io/File;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Ljava/io/File;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$FolderSorter;->compare(Ljava/io/File;Ljava/io/File;)I

    move-result v0

    return v0
.end method
