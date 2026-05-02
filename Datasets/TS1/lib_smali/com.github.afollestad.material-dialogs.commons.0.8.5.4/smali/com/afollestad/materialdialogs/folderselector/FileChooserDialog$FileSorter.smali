.class Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$FileSorter;
.super Ljava/lang/Object;
.source "FileChooserDialog.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FileSorter"
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
    .line 278
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$1;)V
    .registers 2
    .param p1, "x0"    # Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$1;

    .prologue
    .line 278
    invoke-direct {p0}, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$FileSorter;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Ljava/io/File;Ljava/io/File;)I
    .registers 5
    .param p1, "lhs"    # Ljava/io/File;
    .param p2, "rhs"    # Ljava/io/File;

    .prologue
    .line 281
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-virtual {p2}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_e

    .line 282
    const/4 v0, -0x1

    .line 286
    :goto_d
    return v0

    .line 283
    :cond_e
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_1c

    invoke-virtual {p2}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 284
    const/4 v0, 0x1

    goto :goto_d

    .line 286
    :cond_1c
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    goto :goto_d
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 278
    check-cast p1, Ljava/io/File;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Ljava/io/File;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$FileSorter;->compare(Ljava/io/File;Ljava/io/File;)I

    move-result v0

    return v0
.end method
