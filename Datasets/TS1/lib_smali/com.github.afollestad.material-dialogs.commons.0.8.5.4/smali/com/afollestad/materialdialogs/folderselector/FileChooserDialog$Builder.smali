.class public Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$Builder;
.super Ljava/lang/Object;
.source "FileChooserDialog.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected mCancelButton:I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field protected mChooseButton:I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field protected final transient mContext:Landroid/support/v7/app/AppCompatActivity;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field protected mInitialPath:Ljava/lang/String;

.field protected mMimeType:Ljava/lang/String;

.field protected mTag:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/support/v7/app/AppCompatActivity;)V
    .registers 3
    .param p1    # Landroid/support/v7/app/AppCompatActivity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<ActivityType:",
            "Landroid/support/v7/app/AppCompatActivity;",
            ":",
            "Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$FileCallback;",
            ">(TActivityType;)V"
        }
    .end annotation

    .prologue
    .line 208
    .local p1, "context":Landroid/support/v7/app/AppCompatActivity;, "TActivityType;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 209
    iput-object p1, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$Builder;->mContext:Landroid/support/v7/app/AppCompatActivity;

    .line 210
    const/high16 v0, 0x1040000

    iput v0, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$Builder;->mCancelButton:I

    .line 211
    sget v0, Lcom/afollestad/materialdialogs/commons/R$string;->md_choose_label:I

    iput v0, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$Builder;->mChooseButton:I

    .line 212
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$Builder;->mInitialPath:Ljava/lang/String;

    .line 213
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$Builder;->mMimeType:Ljava/lang/String;

    .line 214
    return-void
.end method


# virtual methods
.method public build()Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;
    .registers 4
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 252
    new-instance v1, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;

    invoke-direct {v1}, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;-><init>()V

    .line 253
    .local v1, "dialog":Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 254
    .local v0, "args":Landroid/os/Bundle;
    const-string v2, "builder"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 255
    invoke-virtual {v1, v0}, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->setArguments(Landroid/os/Bundle;)V

    .line 256
    return-object v1
.end method

.method public cancelButton(I)Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$Builder;
    .registers 2
    .param p1, "text"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 218
    iput p1, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$Builder;->mCancelButton:I

    .line 219
    return-object p0
.end method

.method public chooseButton(I)Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$Builder;
    .registers 2
    .param p1, "text"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 224
    iput p1, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$Builder;->mChooseButton:I

    .line 225
    return-object p0
.end method

.method public initialPath(Ljava/lang/String;)Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$Builder;
    .registers 2
    .param p1, "initialPath"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 230
    if-nez p1, :cond_4

    .line 231
    sget-object p1, Ljava/io/File;->separator:Ljava/lang/String;

    .line 232
    :cond_4
    iput-object p1, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$Builder;->mInitialPath:Ljava/lang/String;

    .line 233
    return-object p0
.end method

.method public mimeType(Ljava/lang/String;)Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$Builder;
    .registers 2
    .param p1, "type"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 238
    iput-object p1, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$Builder;->mMimeType:Ljava/lang/String;

    .line 239
    return-object p0
.end method

.method public show()Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;
    .registers 3
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 261
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$Builder;->build()Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;

    move-result-object v0

    .line 262
    .local v0, "dialog":Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;
    iget-object v1, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$Builder;->mContext:Landroid/support/v7/app/AppCompatActivity;

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog;->show(Landroid/support/v4/app/FragmentActivity;)V

    .line 263
    return-object v0
.end method

.method public tag(Ljava/lang/String;)Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$Builder;
    .registers 2
    .param p1, "tag"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 244
    if-nez p1, :cond_4

    .line 245
    const-string p1, "[MD_FILE_SELECTOR]"

    .line 246
    :cond_4
    iput-object p1, p0, Lcom/afollestad/materialdialogs/folderselector/FileChooserDialog$Builder;->mTag:Ljava/lang/String;

    .line 247
    return-object p0
.end method
