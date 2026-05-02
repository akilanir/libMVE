.class public Lnl/siegmann/epublib/domain/GuideReference;
.super Lnl/siegmann/epublib/domain/TitledResourceReference;
.source "GuideReference.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static ACKNOWLEDGEMENTS:Ljava/lang/String; = null

.field public static BIBLIOGRAPHY:Ljava/lang/String; = null

.field public static COLOPHON:Ljava/lang/String; = null

.field public static COPYRIGHT_PAGE:Ljava/lang/String; = null

.field public static COVER:Ljava/lang/String; = null

.field public static DEDICATION:Ljava/lang/String; = null

.field public static EPIGRAPH:Ljava/lang/String; = null

.field public static FOREWORD:Ljava/lang/String; = null

.field public static GLOSSARY:Ljava/lang/String; = null

.field public static INDEX:Ljava/lang/String; = null

.field public static LOI:Ljava/lang/String; = null

.field public static LOT:Ljava/lang/String; = null

.field public static NOTES:Ljava/lang/String; = null

.field public static PREFACE:Ljava/lang/String; = null

.field public static TEXT:Ljava/lang/String; = null

.field public static TITLE_PAGE:Ljava/lang/String; = null

.field public static TOC:Ljava/lang/String; = null

.field private static final serialVersionUID:J = -0x4634bc3a1299e1aL


# instance fields
.field private type:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 26
    const-string v0, "cover"

    sput-object v0, Lnl/siegmann/epublib/domain/GuideReference;->COVER:Ljava/lang/String;

    .line 31
    const-string v0, "title-page"

    sput-object v0, Lnl/siegmann/epublib/domain/GuideReference;->TITLE_PAGE:Ljava/lang/String;

    .line 38
    const-string v0, "toc"

    sput-object v0, Lnl/siegmann/epublib/domain/GuideReference;->TOC:Ljava/lang/String;

    .line 43
    const-string v0, "index"

    sput-object v0, Lnl/siegmann/epublib/domain/GuideReference;->INDEX:Ljava/lang/String;

    .line 44
    const-string v0, "glossary"

    sput-object v0, Lnl/siegmann/epublib/domain/GuideReference;->GLOSSARY:Ljava/lang/String;

    .line 45
    const-string v0, "acknowledgements"

    sput-object v0, Lnl/siegmann/epublib/domain/GuideReference;->ACKNOWLEDGEMENTS:Ljava/lang/String;

    .line 46
    const-string v0, "bibliography"

    sput-object v0, Lnl/siegmann/epublib/domain/GuideReference;->BIBLIOGRAPHY:Ljava/lang/String;

    .line 47
    const-string v0, "colophon"

    sput-object v0, Lnl/siegmann/epublib/domain/GuideReference;->COLOPHON:Ljava/lang/String;

    .line 48
    const-string v0, "copyright-page"

    sput-object v0, Lnl/siegmann/epublib/domain/GuideReference;->COPYRIGHT_PAGE:Ljava/lang/String;

    .line 49
    const-string v0, "dedication"

    sput-object v0, Lnl/siegmann/epublib/domain/GuideReference;->DEDICATION:Ljava/lang/String;

    .line 55
    const-string v0, "epigraph"

    sput-object v0, Lnl/siegmann/epublib/domain/GuideReference;->EPIGRAPH:Ljava/lang/String;

    .line 57
    const-string v0, "foreword"

    sput-object v0, Lnl/siegmann/epublib/domain/GuideReference;->FOREWORD:Ljava/lang/String;

    .line 62
    const-string v0, "loi"

    sput-object v0, Lnl/siegmann/epublib/domain/GuideReference;->LOI:Ljava/lang/String;

    .line 67
    const-string v0, "lot"

    sput-object v0, Lnl/siegmann/epublib/domain/GuideReference;->LOT:Ljava/lang/String;

    .line 68
    const-string v0, "notes"

    sput-object v0, Lnl/siegmann/epublib/domain/GuideReference;->NOTES:Ljava/lang/String;

    .line 69
    const-string v0, "preface"

    sput-object v0, Lnl/siegmann/epublib/domain/GuideReference;->PREFACE:Ljava/lang/String;

    .line 74
    const-string v0, "text"

    sput-object v0, Lnl/siegmann/epublib/domain/GuideReference;->TEXT:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lnl/siegmann/epublib/domain/Resource;)V
    .registers 3
    .param p1, "resource"    # Lnl/siegmann/epublib/domain/Resource;

    .prologue
    .line 79
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lnl/siegmann/epublib/domain/GuideReference;-><init>(Lnl/siegmann/epublib/domain/Resource;Ljava/lang/String;)V

    .line 80
    return-void
.end method

.method public constructor <init>(Lnl/siegmann/epublib/domain/Resource;Ljava/lang/String;)V
    .registers 3
    .param p1, "resource"    # Lnl/siegmann/epublib/domain/Resource;
    .param p2, "title"    # Ljava/lang/String;

    .prologue
    .line 83
    invoke-direct {p0, p1, p2}, Lnl/siegmann/epublib/domain/TitledResourceReference;-><init>(Lnl/siegmann/epublib/domain/Resource;Ljava/lang/String;)V

    .line 84
    return-void
.end method

.method public constructor <init>(Lnl/siegmann/epublib/domain/Resource;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "resource"    # Lnl/siegmann/epublib/domain/Resource;
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "title"    # Ljava/lang/String;

    .prologue
    .line 87
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lnl/siegmann/epublib/domain/GuideReference;-><init>(Lnl/siegmann/epublib/domain/Resource;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    return-void
.end method

.method public constructor <init>(Lnl/siegmann/epublib/domain/Resource;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "resource"    # Lnl/siegmann/epublib/domain/Resource;
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "title"    # Ljava/lang/String;
    .param p4, "fragmentId"    # Ljava/lang/String;

    .prologue
    .line 91
    invoke-direct {p0, p1, p3, p4}, Lnl/siegmann/epublib/domain/TitledResourceReference;-><init>(Lnl/siegmann/epublib/domain/Resource;Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    invoke-static {p2}, Lnl/siegmann/epublib/util/StringUtil;->isNotBlank(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_10

    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    :goto_d
    iput-object v0, p0, Lnl/siegmann/epublib/domain/GuideReference;->type:Ljava/lang/String;

    .line 93
    return-void

    .line 92
    :cond_10
    const/4 v0, 0x0

    goto :goto_d
.end method


# virtual methods
.method public getType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 96
    iget-object v0, p0, Lnl/siegmann/epublib/domain/GuideReference;->type:Ljava/lang/String;

    return-object v0
.end method

.method public setType(Ljava/lang/String;)V
    .registers 2
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 100
    iput-object p1, p0, Lnl/siegmann/epublib/domain/GuideReference;->type:Ljava/lang/String;

    .line 101
    return-void
.end method
