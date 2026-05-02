.class public Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$Builder;
.super Ljava/lang/Object;
.source "FolderChooserDialog.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;
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
            "Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$FolderCallback;",
            ">(TActivityType;)V"
        }
    .end annotation

    .prologue
    .line 163
    .local p1, "context":Landroid/support/v7/app/AppCompatActivity;, "TActivityType;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 164
    iput-object p1, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$Builder;->mContext:Landroid/support/v7/app/AppCompatActivity;

    .line 165
    sget v0, Lcom/afollestad/materialdialogs/commons/R$string;->md_choose_label:I

    iput v0, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$Builder;->mChooseButton:I

    .line 166
    const/high16 v0, 0x1040000

    iput v0, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$Builder;->mCancelButton:I

    .line 167
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$Builder;->mInitialPath:Ljava/lang/String;

    .line 168
    return-void
.end method


# virtual methods
.method public build()Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;
    .registers 4
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 200
    new-instance v1, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;

    invoke-direct {v1}, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;-><init>()V

    .line 201
    .local v1, "dialog":Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 202
    .local v0, "args":Landroid/os/Bundle;
    const-string v2, "builder"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 203
    invoke-virtual {v1, v0}, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->setArguments(Landroid/os/Bundle;)V

    .line 204
    return-object v1
.end method

.method public cancelButton(I)Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$Builder;
    .registers 2
    .param p1, "text"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 178
    iput p1, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$Builder;->mCancelButton:I

    .line 179
    return-object p0
.end method

.method public chooseButton(I)Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$Builder;
    .registers 2
    .param p1, "text"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 172
    iput p1, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$Builder;->mChooseButton:I

    .line 173
    return-object p0
.end method

.method public initialPath(Ljava/lang/String;)Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$Builder;
    .registers 2
    .param p1, "initialPath"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 184
    if-nez p1, :cond_4

    .line 185
    sget-object p1, Ljava/io/File;->separator:Ljava/lang/String;

    .line 186
    :cond_4
    iput-object p1, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$Builder;->mInitialPath:Ljava/lang/String;

    .line 187
    return-object p0
.end method

.method public show()Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;
    .registers 3
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 209
    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$Builder;->build()Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;

    move-result-object v0

    .line 210
    .local v0, "dialog":Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;
    iget-object v1, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$Builder;->mContext:Landroid/support/v7/app/AppCompatActivity;

    invoke-virtual {v0, v1}, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog;->show(Landroid/support/v4/app/FragmentActivity;)V

    .line 211
    return-object v0
.end method

.method public tag(Ljava/lang/String;)Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$Builder;
    .registers 2
    .param p1, "tag"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 192
    if-nez p1, :cond_4

    .line 193
    const-string p1, "[MD_FOLDER_SELECTOR]"

    .line 194
    :cond_4
    iput-object p1, p0, Lcom/afollestad/materialdialogs/folderselector/FolderChooserDialog$Builder;->mTag:Ljava/lang/String;

    .line 195
    return-object p0
.end method
