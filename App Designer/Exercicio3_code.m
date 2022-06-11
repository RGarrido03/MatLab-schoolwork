classdef Exercicio3_code < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                     matlab.ui.Figure
        GridLayout                   matlab.ui.container.GridLayout
        LeftPanel                    matlab.ui.container.Panel
        x30sqrt25y2Label             matlab.ui.control.Label
        ParbolaLabel                 matlab.ui.control.Label
        Retay0x25Label               matlab.ui.control.Label
        mbLabel                      matlab.ui.control.Label
        RetaLabel                    matlab.ui.control.Label
        Teste20202021Label           matlab.ui.control.Label
        Exerccio3Label               matlab.ui.control.Label
        DeclivedaretaEditField       matlab.ui.control.NumericEditField
        DeclivedaretaEditFieldLabel  matlab.ui.control.Label
        RightPanel                   matlab.ui.container.Panel
        UIAxes                       matlab.ui.control.UIAxes
    end

    % Properties that correspond to apps with auto-reflow
    properties (Access = private)
        onePanelWidth = 576;
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            y = -5:0.01:5;
            x = 30 - sqrt(25-y.^2);
            plot(app.UIAxes,x,y,'k-')
            app.UIAxes.XLim = [min(x) max(x)];
            app.UIAxes.YLim = [min(y) max(y)];
        end

        % Value changed function: DeclivedaretaEditField
        function updateGraph(app, event)
            value = app.DeclivedaretaEditField.Value;
            y = -5:0.01:5;
            x = 30 - sqrt(25-y.^2);
            y_reta = value * x - 2.5;
            plot(app.UIAxes,x,y,'k-',x,y_reta,'m-')
            app.Retay0x25Label.Text = strcat("Reta: y = ",num2str(value),'x - 2.5');
        end

        % Changes arrangement of the app based on UIFigure width
        function updateAppLayout(app, event)
            currentFigureWidth = app.UIFigure.Position(3);
            if(currentFigureWidth <= app.onePanelWidth)
                % Change to a 2x1 grid
                app.GridLayout.RowHeight = {480, 480};
                app.GridLayout.ColumnWidth = {'1x'};
                app.RightPanel.Layout.Row = 2;
                app.RightPanel.Layout.Column = 1;
            else
                % Change to a 1x2 grid
                app.GridLayout.RowHeight = {'1x'};
                app.GridLayout.ColumnWidth = {220, '1x'};
                app.RightPanel.Layout.Row = 1;
                app.RightPanel.Layout.Column = 2;
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.AutoResizeChildren = 'off';
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';
            app.UIFigure.SizeChangedFcn = createCallbackFcn(app, @updateAppLayout, true);

            % Create GridLayout
            app.GridLayout = uigridlayout(app.UIFigure);
            app.GridLayout.ColumnWidth = {220, '1x'};
            app.GridLayout.RowHeight = {'1x'};
            app.GridLayout.ColumnSpacing = 0;
            app.GridLayout.RowSpacing = 0;
            app.GridLayout.Padding = [0 0 0 0];
            app.GridLayout.Scrollable = 'on';

            % Create LeftPanel
            app.LeftPanel = uipanel(app.GridLayout);
            app.LeftPanel.BorderType = 'none';
            app.LeftPanel.BackgroundColor = [1 1 1];
            app.LeftPanel.Layout.Row = 1;
            app.LeftPanel.Layout.Column = 1;

            % Create DeclivedaretaEditFieldLabel
            app.DeclivedaretaEditFieldLabel = uilabel(app.LeftPanel);
            app.DeclivedaretaEditFieldLabel.Position = [24 307 172 22];
            app.DeclivedaretaEditFieldLabel.Text = 'Declive da reta';

            % Create DeclivedaretaEditField
            app.DeclivedaretaEditField = uieditfield(app.LeftPanel, 'numeric');
            app.DeclivedaretaEditField.ValueChangedFcn = createCallbackFcn(app, @updateGraph, true);
            app.DeclivedaretaEditField.HorizontalAlignment = 'left';
            app.DeclivedaretaEditField.Position = [24 284 172 22];

            % Create Exerccio3Label
            app.Exerccio3Label = uilabel(app.LeftPanel);
            app.Exerccio3Label.FontSize = 28;
            app.Exerccio3Label.FontWeight = 'bold';
            app.Exerccio3Label.Position = [24 419 161 37];
            app.Exerccio3Label.Text = 'Exercício 3.';

            % Create Teste20202021Label
            app.Teste20202021Label = uilabel(app.LeftPanel);
            app.Teste20202021Label.FontSize = 16;
            app.Teste20202021Label.FontWeight = 'bold';
            app.Teste20202021Label.Position = [24 396 126 22];
            app.Teste20202021Label.Text = 'Teste 2020/2021';

            % Create RetaLabel
            app.RetaLabel = uilabel(app.LeftPanel);
            app.RetaLabel.FontSize = 16;
            app.RetaLabel.FontWeight = 'bold';
            app.RetaLabel.Position = [24 332 40 22];
            app.RetaLabel.Text = 'Reta';

            % Create mbLabel
            app.mbLabel = uilabel(app.LeftPanel);
            app.mbLabel.FontName = 'Cambria Math';
            app.mbLabel.FontSize = 16;
            app.mbLabel.FontWeight = 'bold';
            app.mbLabel.Position = [66 332 85 22];
            app.mbLabel.Text = '𝑦 = m𝑥 + b';

            % Create Retay0x25Label
            app.Retay0x25Label = uilabel(app.LeftPanel);
            app.Retay0x25Label.Position = [24 247 172 22];
            app.Retay0x25Label.Text = 'Reta: y = 0x - 2.5';

            % Create ParbolaLabel
            app.ParbolaLabel = uilabel(app.LeftPanel);
            app.ParbolaLabel.FontSize = 16;
            app.ParbolaLabel.FontWeight = 'bold';
            app.ParbolaLabel.Position = [24 176 73 22];
            app.ParbolaLabel.Text = 'Parábola';

            % Create x30sqrt25y2Label
            app.x30sqrt25y2Label = uilabel(app.LeftPanel);
            app.x30sqrt25y2Label.Position = [25 154 128 22];
            app.x30sqrt25y2Label.Text = 'x = 30-sqrt(25-y.^2)';

            % Create RightPanel
            app.RightPanel = uipanel(app.GridLayout);
            app.RightPanel.BorderType = 'none';
            app.RightPanel.BackgroundColor = [0.9608 0.9608 0.9608];
            app.RightPanel.Layout.Row = 1;
            app.RightPanel.Layout.Column = 2;

            % Create UIAxes
            app.UIAxes = uiaxes(app.RightPanel);
            title(app.UIAxes, 'O Matlab é uma merda')
            xlabel(app.UIAxes, 'X')
            ylabel(app.UIAxes, 'Y')
            zlabel(app.UIAxes, 'Z')
            app.UIAxes.XLim = [0 1];
            app.UIAxes.YLim = [-5 5];
            app.UIAxes.Position = [19 25 381 431];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Exercicio3_code

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end