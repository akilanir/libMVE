.class public Lorg/dmfs/android/xmlmagic/tokenresolvers/CursorTokenResolver;
.super Ljava/lang/Object;

# interfaces
.implements Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;


# instance fields
.field private final mCursor:Landroid/database/Cursor;


# direct methods
.method public constructor <init>(Landroid/database/Cursor;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/dmfs/android/xmlmagic/tokenresolvers/CursorTokenResolver;->mCursor:Landroid/database/Cursor;

    return-void
.end method


# virtual methods
.method public resolveToken(Ljava/lang/String;)Ljava/lang/CharSequence;
    .registers 5

    const/4 v0, 0x0

    if-nez p1, :cond_4

    :cond_3
    :goto_3
    return-object v0

    :cond_4
    const-string v1, "@cursor:"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/16 v1, 0x8

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/dmfs/android/xmlmagic/tokenresolvers/CursorTokenResolver;->mCursor:Landroid/database/Cursor;

    invoke-interface {v2, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    if-ltz v1, :cond_3

    iget-object v0, p0, Lorg/dmfs/android/xmlmagic/tokenresolvers/CursorTokenResolver;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_3
.end method
