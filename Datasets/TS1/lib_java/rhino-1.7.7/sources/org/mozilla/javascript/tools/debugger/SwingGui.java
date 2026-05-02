package org.mozilla.javascript.tools.debugger;

import java.awt.ActiveEvent;
import java.awt.BorderLayout;
import java.awt.Component;
import java.awt.Dimension;
import java.awt.EventQueue;
import java.awt.MenuComponent;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JDesktopPane;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JInternalFrame;
import javax.swing.JLabel;
import javax.swing.JMenu;
import javax.swing.JMenuItem;
import javax.swing.JPanel;
import javax.swing.JSplitPane;
import javax.swing.JTextArea;
import javax.swing.JToolBar;
import javax.swing.SwingUtilities;
import javax.swing.filechooser.FileFilter;
import javax.swing.text.BadLocationException;
import org.mozilla.javascript.Kit;
import org.mozilla.javascript.SecurityUtilities;
import org.mozilla.javascript.tools.debugger.Dim;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/debugger/SwingGui.class */
public class SwingGui extends JFrame implements GuiCallback {
    private static final long serialVersionUID = -8217029773456711621L;
    Dim dim;
    private Runnable exitAction;
    private JDesktopPane desk;
    private ContextWindow context;
    private Menubar menubar;
    private JToolBar toolBar;
    private JSInternalConsole console;
    private JSplitPane split1;
    private JLabel statusBar;
    private final Map<String, JFrame> toplevels;
    private final Map<String, FileWindow> fileWindows;
    private FileWindow currentWindow;
    JFileChooser dlg;
    private EventQueue awtEventQueue;

    public SwingGui(Dim dim, String title) {
        super(title);
        this.toplevels = Collections.synchronizedMap(new HashMap());
        this.fileWindows = Collections.synchronizedMap(new HashMap());
        this.dim = dim;
        init();
        dim.setGuiCallback(this);
    }

    public Menubar getMenubar() {
        return this.menubar;
    }

    public void setExitAction(Runnable r) {
        this.exitAction = r;
    }

    public JSInternalConsole getConsole() {
        return this.console;
    }

    public void setVisible(boolean b) {
        super.setVisible(b);
        if (b) {
            this.console.consoleTextArea.requestFocus();
            this.context.split.setDividerLocation(0.5d);
            try {
                this.console.setMaximum(true);
                this.console.setSelected(true);
                this.console.show();
                this.console.consoleTextArea.requestFocus();
            } catch (Exception e) {
            }
        }
    }

    void addTopLevel(String key, JFrame frame) {
        if (frame != this) {
            this.toplevels.put(key, frame);
        }
    }

    private void init() {
        this.menubar = new Menubar(this);
        setJMenuBar(this.menubar);
        this.toolBar = new JToolBar();
        String[] toolTips = {"Break (Pause)", "Go (F5)", "Step Into (F11)", "Step Over (F7)", "Step Out (F8)"};
        JButton button = new JButton("Break");
        button.setToolTipText("Break");
        button.setActionCommand("Break");
        button.addActionListener(this.menubar);
        button.setEnabled(true);
        int count = 0 + 1;
        button.setToolTipText(toolTips[0]);
        JButton button2 = new JButton("Go");
        button2.setToolTipText("Go");
        button2.setActionCommand("Go");
        button2.addActionListener(this.menubar);
        button2.setEnabled(false);
        int count2 = count + 1;
        button2.setToolTipText(toolTips[count]);
        JButton button3 = new JButton("Step Into");
        button3.setToolTipText("Step Into");
        button3.setActionCommand("Step Into");
        button3.addActionListener(this.menubar);
        button3.setEnabled(false);
        int count3 = count2 + 1;
        button3.setToolTipText(toolTips[count2]);
        JButton button4 = new JButton("Step Over");
        button4.setToolTipText("Step Over");
        button4.setActionCommand("Step Over");
        button4.setEnabled(false);
        button4.addActionListener(this.menubar);
        int count4 = count3 + 1;
        button4.setToolTipText(toolTips[count3]);
        JButton button5 = new JButton("Step Out");
        button5.setToolTipText("Step Out");
        button5.setActionCommand("Step Out");
        button5.setEnabled(false);
        button5.addActionListener(this.menubar);
        int i = count4 + 1;
        button5.setToolTipText(toolTips[count4]);
        Dimension dim = button4.getPreferredSize();
        button.setPreferredSize(dim);
        button.setMinimumSize(dim);
        button.setMaximumSize(dim);
        button.setSize(dim);
        button2.setPreferredSize(dim);
        button2.setMinimumSize(dim);
        button2.setMaximumSize(dim);
        button3.setPreferredSize(dim);
        button3.setMinimumSize(dim);
        button3.setMaximumSize(dim);
        button4.setPreferredSize(dim);
        button4.setMinimumSize(dim);
        button4.setMaximumSize(dim);
        button5.setPreferredSize(dim);
        button5.setMinimumSize(dim);
        button5.setMaximumSize(dim);
        this.toolBar.add(button);
        this.toolBar.add(button2);
        this.toolBar.add(button3);
        this.toolBar.add(button4);
        this.toolBar.add(button5);
        JPanel contentPane = new JPanel();
        contentPane.setLayout(new BorderLayout());
        getContentPane().add(this.toolBar, "North");
        getContentPane().add(contentPane, "Center");
        this.desk = new JDesktopPane();
        this.desk.setPreferredSize(new Dimension(600, 300));
        this.desk.setMinimumSize(new Dimension(150, 50));
        JDesktopPane jDesktopPane = this.desk;
        JSInternalConsole jSInternalConsole = new JSInternalConsole("JavaScript Console");
        this.console = jSInternalConsole;
        jDesktopPane.add(jSInternalConsole);
        this.context = new ContextWindow(this);
        this.context.setPreferredSize(new Dimension(600, 120));
        this.context.setMinimumSize(new Dimension(50, 50));
        this.split1 = new JSplitPane(0, this.desk, this.context);
        this.split1.setOneTouchExpandable(true);
        setResizeWeight(this.split1, 0.66d);
        contentPane.add(this.split1, "Center");
        this.statusBar = new JLabel();
        this.statusBar.setText("Thread: ");
        contentPane.add(this.statusBar, "South");
        this.dlg = new JFileChooser();
        FileFilter filter = new FileFilter() { // from class: org.mozilla.javascript.tools.debugger.SwingGui.1
            public boolean accept(File f) {
                if (f.isDirectory()) {
                    return true;
                }
                String n = f.getName();
                int i2 = n.lastIndexOf(46);
                if (i2 > 0 && i2 < n.length() - 1) {
                    String ext = n.substring(i2 + 1).toLowerCase();
                    if (ext.equals("js")) {
                        return true;
                    }
                    return false;
                }
                return false;
            }

            public String getDescription() {
                return "JavaScript Files (*.js)";
            }
        };
        this.dlg.addChoosableFileFilter(filter);
        addWindowListener(new WindowAdapter() { // from class: org.mozilla.javascript.tools.debugger.SwingGui.2
            public void windowClosing(WindowEvent e) {
                SwingGui.this.exit();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void exit() {
        if (this.exitAction != null) {
            SwingUtilities.invokeLater(this.exitAction);
        }
        this.dim.setReturnValue(5);
    }

    FileWindow getFileWindow(String url) {
        if (url == null || url.equals("<stdin>")) {
            return null;
        }
        return this.fileWindows.get(url);
    }

    static String getShortName(String url) {
        int lastSlash = url.lastIndexOf(47);
        if (lastSlash < 0) {
            lastSlash = url.lastIndexOf(92);
        }
        String shortName = url;
        if (lastSlash >= 0 && lastSlash + 1 < url.length()) {
            shortName = url.substring(lastSlash + 1);
        }
        return shortName;
    }

    void removeWindow(FileWindow w) {
        this.fileWindows.remove(w.getUrl());
        JMenu windowMenu = getWindowMenu();
        int count = windowMenu.getItemCount();
        JMenuItem lastItem = windowMenu.getItem(count - 1);
        String name = getShortName(w.getUrl());
        int i = 5;
        while (true) {
            if (i >= count) {
                break;
            }
            JMenuItem item = windowMenu.getItem(i);
            if (item != null) {
                String text = item.getText();
                int pos = text.indexOf(32);
                if (text.substring(pos + 1).equals(name)) {
                    windowMenu.remove(item);
                    if (count == 6) {
                        windowMenu.remove(4);
                    } else {
                        int j = i - 4;
                        while (i < count - 1) {
                            JMenuItem thisItem = windowMenu.getItem(i);
                            if (thisItem != null) {
                                String text2 = thisItem.getText();
                                if (text2.equals("More Windows...")) {
                                    break;
                                }
                                int pos2 = text2.indexOf(32);
                                thisItem.setText(((char) (48 + j)) + " " + text2.substring(pos2 + 1));
                                thisItem.setMnemonic(48 + j);
                                j++;
                            }
                            i++;
                        }
                        if (count - 6 == 0 && lastItem != item && lastItem.getText().equals("More Windows...")) {
                            windowMenu.remove(lastItem);
                        }
                    }
                }
            }
            i++;
        }
        windowMenu.revalidate();
    }

    void showStopLine(Dim.StackFrame frame) {
        String sourceName = frame.getUrl();
        if (sourceName == null || sourceName.equals("<stdin>")) {
            if (this.console.isVisible()) {
                this.console.show();
            }
        } else {
            showFileWindow(sourceName, -1);
            int lineNumber = frame.getLineNumber();
            FileWindow w = getFileWindow(sourceName);
            if (w != null) {
                setFilePosition(w, lineNumber);
            }
        }
    }

    protected void showFileWindow(String sourceUrl, int lineNumber) {
        FileWindow w = getFileWindow(sourceUrl);
        if (w == null) {
            Dim.SourceInfo si = this.dim.sourceInfo(sourceUrl);
            createFileWindow(si, -1);
            w = getFileWindow(sourceUrl);
        }
        if (lineNumber > -1) {
            int start = w.getPosition(lineNumber - 1);
            int end = w.getPosition(lineNumber) - 1;
            w.textArea.select(start);
            w.textArea.setCaretPosition(start);
            w.textArea.moveCaretPosition(end);
        }
        try {
            if (w.isIcon()) {
                w.setIcon(false);
            }
            w.setVisible(true);
            w.moveToFront();
            w.setSelected(true);
            requestFocus();
            w.requestFocus();
            w.textArea.requestFocus();
        } catch (Exception e) {
        }
    }

    protected void createFileWindow(Dim.SourceInfo sourceInfo, int line) {
        String url = sourceInfo.url();
        FileWindow w = new FileWindow(this, sourceInfo);
        this.fileWindows.put(url, w);
        if (line != -1) {
            if (this.currentWindow != null) {
                this.currentWindow.setPosition(-1);
            }
            try {
                w.setPosition(w.textArea.getLineStartOffset(line - 1));
            } catch (BadLocationException e) {
                try {
                    w.setPosition(w.textArea.getLineStartOffset(0));
                } catch (BadLocationException e2) {
                    w.setPosition(-1);
                }
            }
        }
        this.desk.add(w);
        if (line != -1) {
            this.currentWindow = w;
        }
        this.menubar.addFile(url);
        w.setVisible(true);
        if (1 != 0) {
            try {
                w.setMaximum(true);
                w.setSelected(true);
                w.moveToFront();
            } catch (Exception e3) {
            }
        }
    }

    protected boolean updateFileWindow(Dim.SourceInfo sourceInfo) {
        String fileName = sourceInfo.url();
        FileWindow w = getFileWindow(fileName);
        if (w != null) {
            w.updateText(sourceInfo);
            w.show();
            return true;
        }
        return false;
    }

    private void setFilePosition(FileWindow w, int line) {
        JTextArea ta = w.textArea;
        try {
            if (line == -1) {
                w.setPosition(-1);
                if (this.currentWindow == w) {
                    this.currentWindow = null;
                }
            } else {
                int loc = ta.getLineStartOffset(line - 1);
                if (this.currentWindow != null && this.currentWindow != w) {
                    this.currentWindow.setPosition(-1);
                }
                w.setPosition(loc);
                this.currentWindow = w;
            }
        } catch (BadLocationException e) {
        }
        if (1 != 0) {
            if (w.isIcon()) {
                this.desk.getDesktopManager().deiconifyFrame(w);
            }
            this.desk.getDesktopManager().activateFrame(w);
            try {
                w.show();
                w.toFront();
                w.setSelected(true);
            } catch (Exception e2) {
            }
        }
    }

    void enterInterruptImpl(Dim.StackFrame lastFrame, String threadTitle, String alertMessage) {
        this.statusBar.setText("Thread: " + threadTitle);
        showStopLine(lastFrame);
        if (alertMessage != null) {
            MessageDialogWrapper.showMessageDialog(this, alertMessage, "Exception in Script", 0);
        }
        updateEnabled(true);
        Dim.ContextData contextData = lastFrame.contextData();
        JComboBox ctx = this.context.context;
        List<String> toolTips = this.context.toolTips;
        this.context.disableUpdate();
        int frameCount = contextData.frameCount();
        ctx.removeAllItems();
        ctx.setSelectedItem((Object) null);
        toolTips.clear();
        for (int i = 0; i < frameCount; i++) {
            Dim.StackFrame frame = contextData.getFrame(i);
            String url = frame.getUrl();
            int lineNumber = frame.getLineNumber();
            String shortName = url;
            if (url.length() > 20) {
                shortName = "..." + url.substring(url.length() - 17);
            }
            String location = "\"" + shortName + "\", line " + lineNumber;
            ctx.insertItemAt(location, i);
            String location2 = "\"" + url + "\", line " + lineNumber;
            toolTips.add(location2);
        }
        this.context.enableUpdate();
        ctx.setSelectedIndex(0);
        ctx.setMinimumSize(new Dimension(50, ctx.getMinimumSize().height));
    }

    private JMenu getWindowMenu() {
        return this.menubar.getMenu(3);
    }

    private String chooseFile(String title) {
        this.dlg.setDialogTitle(title);
        File CWD = null;
        String dir = SecurityUtilities.getSystemProperty("user.dir");
        if (dir != null) {
            CWD = new File(dir);
        }
        if (CWD != null) {
            this.dlg.setCurrentDirectory(CWD);
        }
        int returnVal = this.dlg.showOpenDialog(this);
        if (returnVal == 0) {
            try {
                String result = this.dlg.getSelectedFile().getCanonicalPath();
                File CWD2 = this.dlg.getSelectedFile().getParentFile();
                Properties props = System.getProperties();
                props.put("user.dir", CWD2.getPath());
                System.setProperties(props);
                return result;
            } catch (IOException e) {
                return null;
            } catch (SecurityException e2) {
                return null;
            }
        }
        return null;
    }

    private JInternalFrame getSelectedFrame() {
        JInternalFrame[] frames = this.desk.getAllFrames();
        for (int i = 0; i < frames.length; i++) {
            if (frames[i].isShowing()) {
                return frames[i];
            }
        }
        return frames[frames.length - 1];
    }

    private void updateEnabled(boolean interrupted) {
        boolean z;
        ((Menubar) getJMenuBar()).updateEnabled(interrupted);
        int cc = this.toolBar.getComponentCount();
        for (int ci = 0; ci < cc; ci++) {
            if (ci == 0) {
                z = !interrupted;
            } else {
                z = interrupted;
            }
            boolean enableButton = z;
            this.toolBar.getComponent(ci).setEnabled(enableButton);
        }
        if (interrupted) {
            this.toolBar.setEnabled(true);
            int state = getExtendedState();
            if (state == 1) {
                setExtendedState(0);
            }
            toFront();
            this.context.setEnabled(true);
            return;
        }
        if (this.currentWindow != null) {
            this.currentWindow.setPosition(-1);
        }
        this.context.setEnabled(false);
    }

    static void setResizeWeight(JSplitPane pane, double weight) {
        try {
            Method m = JSplitPane.class.getMethod("setResizeWeight", Double.TYPE);
            m.invoke(pane, new Double(weight));
        } catch (IllegalAccessException e) {
        } catch (NoSuchMethodException e2) {
        } catch (InvocationTargetException e3) {
        }
    }

    private String readFile(String fileName) {
        String text;
        try {
            Reader r = new FileReader(fileName);
            try {
                text = Kit.readReader(r);
                r.close();
            } catch (Throwable th) {
                r.close();
                throw th;
            }
        } catch (IOException ex) {
            MessageDialogWrapper.showMessageDialog(this, ex.getMessage(), "Error reading " + fileName, 0);
            text = null;
        }
        return text;
    }

    @Override // org.mozilla.javascript.tools.debugger.GuiCallback
    public void updateSourceText(Dim.SourceInfo sourceInfo) {
        RunProxy proxy = new RunProxy(this, 3);
        proxy.sourceInfo = sourceInfo;
        SwingUtilities.invokeLater(proxy);
    }

    @Override // org.mozilla.javascript.tools.debugger.GuiCallback
    public void enterInterrupt(Dim.StackFrame lastFrame, String threadTitle, String alertMessage) {
        if (SwingUtilities.isEventDispatchThread()) {
            enterInterruptImpl(lastFrame, threadTitle, alertMessage);
            return;
        }
        RunProxy proxy = new RunProxy(this, 4);
        proxy.lastFrame = lastFrame;
        proxy.threadTitle = threadTitle;
        proxy.alertMessage = alertMessage;
        SwingUtilities.invokeLater(proxy);
    }

    @Override // org.mozilla.javascript.tools.debugger.GuiCallback
    public boolean isGuiEventThread() {
        return SwingUtilities.isEventDispatchThread();
    }

    @Override // org.mozilla.javascript.tools.debugger.GuiCallback
    public void dispatchNextGuiEvent() throws InterruptedException {
        EventQueue queue = this.awtEventQueue;
        if (queue == null) {
            queue = Toolkit.getDefaultToolkit().getSystemEventQueue();
            this.awtEventQueue = queue;
        }
        ActiveEvent nextEvent = queue.getNextEvent();
        if (nextEvent instanceof ActiveEvent) {
            nextEvent.dispatch();
            return;
        }
        Object source = nextEvent.getSource();
        if (source instanceof Component) {
            Component comp = (Component) source;
            comp.dispatchEvent(nextEvent);
        } else if (source instanceof MenuComponent) {
            ((MenuComponent) source).dispatchEvent(nextEvent);
        }
    }

    public void actionPerformed(ActionEvent e) {
        int index;
        String text;
        String text2;
        String cmd = e.getActionCommand();
        int returnValue = -1;
        if (cmd.equals("Cut") || cmd.equals("Copy") || cmd.equals("Paste")) {
            ActionListener selectedFrame = getSelectedFrame();
            if (selectedFrame != null && (selectedFrame instanceof ActionListener)) {
                selectedFrame.actionPerformed(e);
            }
        } else if (cmd.equals("Step Over")) {
            returnValue = 0;
        } else if (cmd.equals("Step Into")) {
            returnValue = 1;
        } else if (cmd.equals("Step Out")) {
            returnValue = 2;
        } else if (cmd.equals("Go")) {
            returnValue = 3;
        } else if (cmd.equals("Break")) {
            this.dim.setBreak();
        } else if (cmd.equals("Exit")) {
            exit();
        } else if (cmd.equals("Open")) {
            String fileName = chooseFile("Select a file to compile");
            if (fileName != null && (text2 = readFile(fileName)) != null) {
                RunProxy proxy = new RunProxy(this, 1);
                proxy.fileName = fileName;
                proxy.text = text2;
                new Thread(proxy).start();
            }
        } else if (cmd.equals("Load")) {
            String fileName2 = chooseFile("Select a file to execute");
            if (fileName2 != null && (text = readFile(fileName2)) != null) {
                RunProxy proxy2 = new RunProxy(this, 2);
                proxy2.fileName = fileName2;
                proxy2.text = text;
                new Thread(proxy2).start();
            }
        } else if (cmd.equals("More Windows...")) {
            MoreWindows dlg = new MoreWindows(this, this.fileWindows, "Window", "Files");
            dlg.showDialog(this);
        } else if (cmd.equals("Console")) {
            if (this.console.isIcon()) {
                this.desk.getDesktopManager().deiconifyFrame(this.console);
            }
            this.console.show();
            this.desk.getDesktopManager().activateFrame(this.console);
            this.console.consoleTextArea.requestFocus();
        } else if (!cmd.equals("Cut") && !cmd.equals("Copy") && !cmd.equals("Paste")) {
            if (cmd.equals("Go to function...")) {
                FindFunction dlg2 = new FindFunction(this, "Go to function", "Function");
                dlg2.showDialog(this);
            } else if (cmd.equals("Tile")) {
                JInternalFrame[] frames = this.desk.getAllFrames();
                int count = frames.length;
                int sqrt = (int) Math.sqrt(count);
                int cols = sqrt;
                int rows = sqrt;
                if (rows * cols < count) {
                    cols++;
                    if (rows * cols < count) {
                        rows++;
                    }
                }
                Dimension size = this.desk.getSize();
                int w = size.width / cols;
                int h = size.height / rows;
                int x = 0;
                int y = 0;
                for (int i = 0; i < rows; i++) {
                    for (int j = 0; j < cols && (index = (i * cols) + j) < frames.length; j++) {
                        JInternalFrame f = frames[index];
                        try {
                            f.setIcon(false);
                            f.setMaximum(false);
                        } catch (Exception e2) {
                        }
                        this.desk.getDesktopManager().setBoundsForFrame(f, x, y, w, h);
                        x += w;
                    }
                    y += h;
                    x = 0;
                }
            } else if (cmd.equals("Cascade")) {
                JInternalFrame[] frames2 = this.desk.getAllFrames();
                int count2 = frames2.length;
                int y2 = 0;
                int x2 = 0;
                int h2 = this.desk.getHeight();
                int d = h2 / count2;
                if (d > 30) {
                    d = 30;
                }
                int i2 = count2 - 1;
                while (i2 >= 0) {
                    JInternalFrame f2 = frames2[i2];
                    try {
                        f2.setIcon(false);
                        f2.setMaximum(false);
                    } catch (Exception e3) {
                    }
                    Dimension dimen = f2.getPreferredSize();
                    int w2 = dimen.width;
                    int h3 = dimen.height;
                    this.desk.getDesktopManager().setBoundsForFrame(f2, x2, y2, w2, h3);
                    i2--;
                    x2 += d;
                    y2 += d;
                }
            } else {
                Object obj = getFileWindow(cmd);
                if (obj != null) {
                    FileWindow w3 = (FileWindow) obj;
                    try {
                        if (w3.isIcon()) {
                            w3.setIcon(false);
                        }
                        w3.setVisible(true);
                        w3.moveToFront();
                        w3.setSelected(true);
                    } catch (Exception e4) {
                    }
                }
            }
        }
        if (returnValue != -1) {
            updateEnabled(false);
            this.dim.setReturnValue(returnValue);
        }
    }
}
