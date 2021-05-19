#ifndef NVUI_GUI_HPP
#define NVUI_GUI_HPP

#include <QObject>
#include <QMainWindow>
#include <QWidget>
#include <QFont>
#include <QToolBar>
#include <QLayout>
#include "nvim.hpp"
#include "titlebar.hpp"
#include "hlstate.hpp"
#include <iostream>
#include <memory>
#include <msgpack.hpp>
#include <QEvent>
#include <unordered_map>
class Window;

constexpr int tolerance = 10; //10px tolerance for resizing

using obj_ref_cb = void (*)(Window*, const msgpack::object&);
/// The main window class which holds the rest of the GUI components.
/// Fundamentally, the Neovim area is just 1 big text box.
/// However, there are additional features that we are trying to
/// support.
class Window : public QMainWindow
{
  Q_OBJECT
public:
  Window(QWidget* parent = nullptr, std::shared_ptr<Nvim> nv = nullptr);
  /**
   * Registers all of the relevant gui event handlers
   * for handling Neovim redraw events, as well as a Neovim
   * notification handler for the 'redraw' method.
   */
  void register_handlers();
  /**
   * Sets a handler for the corresponding function
   * in Neovim's redraw notification.
   */
  void set_handler(std::string method, obj_ref_cb handler);
public slots:
  /**
   * Handles a 'redraw' Neovim notification.
   * TODO: Decide parameter type and how this will be called
   * (signals etc.)
   */
  void handle_redraw(msgpack::object redraw_args);
  /**
   * Starts a resizing or moving operation depending on the coordinates
   * of p.
   */
  void resize_or_move(const QPointF& p);
  /**
   * Handles a Neovim 'BufEnter' event, updating the titlebar with the
   * current file.
   */
  void handle_bufenter(msgpack::object file_args);
  /**
   * Handles a Neovim 'DirChanged' event
   * Some things this would probably do would be:
   * 1. Updating the titlebar text
   * 2. Updating a file tree (if it ever gets added)
   */
  void dirchanged_titlebar(msgpack::object dir_args);
private:
  // Taken from the manual test in the "custom window decorations" Qt article
  bool resizing;
  std::unique_ptr<TitleBar> title_bar;
  HLState hl_state;
  std::shared_ptr<Nvim> nvim;
  std::unordered_map<std::string, obj_ref_cb> handlers;
protected:
  void mousePressEvent(QMouseEvent* event) override;
  void mouseReleaseEvent(QMouseEvent* event) override;
  void mouseMoveEvent(QMouseEvent* event) override;
  void resizeEvent(QResizeEvent* event) override;
  void moveEvent(QMoveEvent* event) override;
};

#endif
