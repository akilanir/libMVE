.class Lorg/mozilla/javascript/tools/debugger/FileWindow;
.super Ljavax/swing/JInternalFrame;
.source "SwingGui.java"

# interfaces
.implements Ljava/awt/event/ActionListener;


# static fields
.field private static final serialVersionUID:J = -0x5636d11088fc17c2L


# instance fields
.field currentPos:I

.field private debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

.field private fileHeader:Lorg/mozilla/javascript/tools/debugger/FileHeader;

.field private p:Ljavax/swing/JScrollPane;

.field private sourceInfo:Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;

.field textArea:Lorg/mozilla/javascript/tools/debugger/FileTextArea;


# direct methods
.method public constructor <init>(Lorg/mozilla/javascript/tools/debugger/SwingGui;Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;)V
    .registers 9
    .param p1, "debugGui"    # Lorg/mozilla/javascript/tools/debugger/SwingGui;
    .param p2, "sourceInfo"    # Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;

    .prologue
    const/4 v2, 0x1

    .line 2163
    invoke-virtual {p2}, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->url()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->getShortName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    move-object v0, p0

    move v3, v2

    move v4, v2

    move v5, v2

    invoke-direct/range {v0 .. v5}, Ljavax/swing/JInternalFrame;-><init>(Ljava/lang/String;ZZZZ)V

    .line 2165
    iput-object p1, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    .line 2166
    iput-object p2, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->sourceInfo:Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;

    .line 2167
    invoke-direct {p0}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->updateToolTip()V

    .line 2168
    const/4 v0, -0x1

    iput v0, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->currentPos:I

    .line 2169
    new-instance v0, Lorg/mozilla/javascript/tools/debugger/FileTextArea;

    invoke-direct {v0, p0}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;-><init>(Lorg/mozilla/javascript/tools/debugger/FileWindow;)V

    iput-object v0, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->textArea:Lorg/mozilla/javascript/tools/debugger/FileTextArea;

    .line 2170
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->textArea:Lorg/mozilla/javascript/tools/debugger/FileTextArea;

    const/16 v1, 0x18

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->setRows(I)V

    .line 2171
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->textArea:Lorg/mozilla/javascript/tools/debugger/FileTextArea;

    const/16 v1, 0x50

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->setColumns(I)V

    .line 2172
    new-instance v0, Ljavax/swing/JScrollPane;

    invoke-direct {v0}, Ljavax/swing/JScrollPane;-><init>()V

    iput-object v0, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->p:Ljavax/swing/JScrollPane;

    .line 2173
    new-instance v0, Lorg/mozilla/javascript/tools/debugger/FileHeader;

    invoke-direct {v0, p0}, Lorg/mozilla/javascript/tools/debugger/FileHeader;-><init>(Lorg/mozilla/javascript/tools/debugger/FileWindow;)V

    iput-object v0, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->fileHeader:Lorg/mozilla/javascript/tools/debugger/FileHeader;

    .line 2174
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->p:Ljavax/swing/JScrollPane;

    iget-object v1, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->textArea:Lorg/mozilla/javascript/tools/debugger/FileTextArea;

    invoke-virtual {v0, v1}, Ljavax/swing/JScrollPane;->setViewportView(Ljava/awt/Component;)V

    .line 2175
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->p:Ljavax/swing/JScrollPane;

    iget-object v1, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->fileHeader:Lorg/mozilla/javascript/tools/debugger/FileHeader;

    invoke-virtual {v0, v1}, Ljavax/swing/JScrollPane;->setRowHeaderView(Ljava/awt/Component;)V

    .line 2176
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->p:Ljavax/swing/JScrollPane;

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->setContentPane(Ljava/awt/Container;)V

    .line 2177
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->pack()V

    .line 2178
    invoke-virtual {p0, p2}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->updateText(Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;)V

    .line 2179
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->textArea:Lorg/mozilla/javascript/tools/debugger/FileTextArea;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->select(I)V

    .line 2180
    return-void
.end method

.method private updateToolTip()V
    .registers 4

    .prologue
    .line 2188
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->getComponentCount()I

    move-result v2

    add-int/lit8 v1, v2, -0x1

    .line 2189
    .local v1, "n":I
    const/4 v2, 0x1

    if-le v1, v2, :cond_1e

    .line 2190
    const/4 v1, 0x1

    .line 2194
    :cond_a
    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->getComponent(I)Ljava/awt/Component;

    move-result-object v0

    .line 2196
    .local v0, "c":Ljava/awt/Component;
    if-eqz v0, :cond_1d

    instance-of v2, v0, Ljavax/swing/JComponent;

    if-eqz v2, :cond_1d

    .line 2197
    check-cast v0, Ljavax/swing/JComponent;

    .end local v0    # "c":Ljava/awt/Component;
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->getUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljavax/swing/JComponent;->setToolTipText(Ljava/lang/String;)V

    .line 2199
    :cond_1d
    :goto_1d
    return-void

    .line 2191
    :cond_1e
    if-gez v1, :cond_a

    goto :goto_1d
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .registers 4
    .param p1, "e"    # Ljava/awt/event/ActionEvent;

    .prologue
    .line 2259
    invoke-virtual {p1}, Ljava/awt/event/ActionEvent;->getActionCommand()Ljava/lang/String;

    move-result-object v0

    .line 2260
    .local v0, "cmd":Ljava/lang/String;
    const-string v1, "Cut"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 2267
    :cond_c
    :goto_c
    return-void

    .line 2262
    :cond_d
    const-string v1, "Copy"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1b

    .line 2263
    iget-object v1, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->textArea:Lorg/mozilla/javascript/tools/debugger/FileTextArea;

    invoke-virtual {v1}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->copy()V

    goto :goto_c

    .line 2264
    :cond_1b
    const-string v1, "Paste"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_c

    goto :goto_c
.end method

.method public clearBreakPoint(I)V
    .registers 5
    .param p1, "line"    # I

    .prologue
    .line 2151
    iget-object v1, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->sourceInfo:Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;

    invoke-virtual {v1, p1}, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->breakableLine(I)Z

    move-result v1

    if-eqz v1, :cond_16

    .line 2152
    iget-object v1, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->sourceInfo:Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->breakpoint(IZ)Z

    move-result v0

    .line 2153
    .local v0, "changed":Z
    if-eqz v0, :cond_16

    .line 2154
    iget-object v1, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->fileHeader:Lorg/mozilla/javascript/tools/debugger/FileHeader;

    invoke-virtual {v1}, Lorg/mozilla/javascript/tools/debugger/FileHeader;->repaint()V

    .line 2157
    .end local v0    # "changed":Z
    :cond_16
    return-void
.end method

.method public dispose()V
    .registers 2

    .prologue
    .line 2249
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    invoke-virtual {v0, p0}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->removeWindow(Lorg/mozilla/javascript/tools/debugger/FileWindow;)V

    .line 2250
    invoke-super {p0}, Ljavax/swing/JInternalFrame;->dispose()V

    .line 2251
    return-void
.end method

.method public getPosition(I)I
    .registers 4
    .param p1, "line"    # I

    .prologue
    .line 2109
    const/4 v0, -0x1

    .line 2111
    .local v0, "result":I
    :try_start_1
    iget-object v1, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->textArea:Lorg/mozilla/javascript/tools/debugger/FileTextArea;

    invoke-virtual {v1, p1}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->getLineStartOffset(I)I
    :try_end_6
    .catch Ljavax/swing/text/BadLocationException; {:try_start_1 .. :try_end_6} :catch_8

    move-result v0

    .line 2114
    :goto_7
    return v0

    .line 2112
    :catch_8
    move-exception v1

    goto :goto_7
.end method

.method public getUrl()Ljava/lang/String;
    .registers 2

    .prologue
    .line 2205
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->sourceInfo:Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->url()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isBreakPoint(I)Z
    .registers 3
    .param p1, "line"    # I

    .prologue
    .line 2121
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->sourceInfo:Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->breakableLine(I)Z

    move-result v0

    if-eqz v0, :cond_12

    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->sourceInfo:Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->breakpoint(I)Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method load()V
    .registers 5

    .prologue
    .line 2096
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->getUrl()Ljava/lang/String;

    move-result-object v1

    .line 2097
    .local v1, "url":Ljava/lang/String;
    if-eqz v1, :cond_20

    .line 2098
    new-instance v0, Lorg/mozilla/javascript/tools/debugger/RunProxy;

    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    const/4 v3, 0x2

    invoke-direct {v0, v2, v3}, Lorg/mozilla/javascript/tools/debugger/RunProxy;-><init>(Lorg/mozilla/javascript/tools/debugger/SwingGui;I)V

    .line 2099
    .local v0, "proxy":Lorg/mozilla/javascript/tools/debugger/RunProxy;
    iput-object v1, v0, Lorg/mozilla/javascript/tools/debugger/RunProxy;->fileName:Ljava/lang/String;

    .line 2100
    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->sourceInfo:Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;

    invoke-virtual {v2}, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->source()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lorg/mozilla/javascript/tools/debugger/RunProxy;->text:Ljava/lang/String;

    .line 2101
    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 2103
    .end local v0    # "proxy":Lorg/mozilla/javascript/tools/debugger/RunProxy;
    :cond_20
    return-void
.end method

.method public select(II)V
    .registers 5
    .param p1, "start"    # I
    .param p2, "end"    # I

    .prologue
    .line 2239
    iget-object v1, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->textArea:Lorg/mozilla/javascript/tools/debugger/FileTextArea;

    invoke-virtual {v1}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->getDocument()Ljavax/swing/text/Document;

    move-result-object v1

    invoke-interface {v1}, Ljavax/swing/text/Document;->getLength()I

    move-result v0

    .line 2240
    .local v0, "docEnd":I
    iget-object v1, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->textArea:Lorg/mozilla/javascript/tools/debugger/FileTextArea;

    invoke-virtual {v1, v0, v0}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->select(II)V

    .line 2241
    iget-object v1, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->textArea:Lorg/mozilla/javascript/tools/debugger/FileTextArea;

    invoke-virtual {v1, p1, p2}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->select(II)V

    .line 2242
    return-void
.end method

.method public setBreakPoint(I)V
    .registers 5
    .param p1, "line"    # I

    .prologue
    .line 2139
    iget-object v1, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->sourceInfo:Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;

    invoke-virtual {v1, p1}, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->breakableLine(I)Z

    move-result v1

    if-eqz v1, :cond_16

    .line 2140
    iget-object v1, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->sourceInfo:Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v2}, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->breakpoint(IZ)Z

    move-result v0

    .line 2141
    .local v0, "changed":Z
    if-eqz v0, :cond_16

    .line 2142
    iget-object v1, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->fileHeader:Lorg/mozilla/javascript/tools/debugger/FileHeader;

    invoke-virtual {v1}, Lorg/mozilla/javascript/tools/debugger/FileHeader;->repaint()V

    .line 2145
    .end local v0    # "changed":Z
    :cond_16
    return-void
.end method

.method public setPosition(I)V
    .registers 3
    .param p1, "pos"    # I

    .prologue
    .line 2230
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->textArea:Lorg/mozilla/javascript/tools/debugger/FileTextArea;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->select(I)V

    .line 2231
    iput p1, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->currentPos:I

    .line 2232
    iget-object v0, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->fileHeader:Lorg/mozilla/javascript/tools/debugger/FileHeader;

    invoke-virtual {v0}, Lorg/mozilla/javascript/tools/debugger/FileHeader;->repaint()V

    .line 2233
    return-void
.end method

.method public toggleBreakPoint(I)V
    .registers 3
    .param p1, "line"    # I

    .prologue
    .line 2128
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->isBreakPoint(I)Z

    move-result v0

    if-nez v0, :cond_a

    .line 2129
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->setBreakPoint(I)V

    .line 2133
    :goto_9
    return-void

    .line 2131
    :cond_a
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/tools/debugger/FileWindow;->clearBreakPoint(I)V

    goto :goto_9
.end method

.method public updateText(Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;)V
    .registers 6
    .param p1, "sourceInfo"    # Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;

    .prologue
    .line 2212
    iput-object p1, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->sourceInfo:Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;

    .line 2213
    invoke-virtual {p1}, Lorg/mozilla/javascript/tools/debugger/Dim$SourceInfo;->source()Ljava/lang/String;

    move-result-object v0

    .line 2214
    .local v0, "newText":Ljava/lang/String;
    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->textArea:Lorg/mozilla/javascript/tools/debugger/FileTextArea;

    invoke-virtual {v2}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->getText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_24

    .line 2215
    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->textArea:Lorg/mozilla/javascript/tools/debugger/FileTextArea;

    invoke-virtual {v2, v0}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->setText(Ljava/lang/String;)V

    .line 2216
    const/4 v1, 0x0

    .line 2217
    .local v1, "pos":I
    iget v2, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->currentPos:I

    const/4 v3, -0x1

    if-eq v2, v3, :cond_1f

    .line 2218
    iget v1, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->currentPos:I

    .line 2220
    :cond_1f
    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->textArea:Lorg/mozilla/javascript/tools/debugger/FileTextArea;

    invoke-virtual {v2, v1}, Lorg/mozilla/javascript/tools/debugger/FileTextArea;->select(I)V

    .line 2222
    .end local v1    # "pos":I
    :cond_24
    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->fileHeader:Lorg/mozilla/javascript/tools/debugger/FileHeader;

    invoke-virtual {v2}, Lorg/mozilla/javascript/tools/debugger/FileHeader;->update()V

    .line 2223
    iget-object v2, p0, Lorg/mozilla/javascript/tools/debugger/FileWindow;->fileHeader:Lorg/mozilla/javascript/tools/debugger/FileHeader;

    invoke-virtual {v2}, Lorg/mozilla/javascript/tools/debugger/FileHeader;->repaint()V

    .line 2224
    return-void
.end method
