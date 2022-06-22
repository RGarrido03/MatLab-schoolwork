classdef ex3_code < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure      matlab.ui.Figure
        Label_right   matlab.ui.control.Label
        Label_left    matlab.ui.control.Label
        Label         matlab.ui.control.Label
        Button_right  matlab.ui.control.Button
        Button_left   matlab.ui.control.Button
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: Button_left
        function Button_leftPushed(app, event)
            app.Label.Text = 'Botão da esquerda pressionado';
            value_left = str2num(app.Label_left.Text);
            value_left = value_left + 1;
            app.Label_left.Text = num2str(value_left);
        end

        % Button pushed function: Button_right
        function Button_rightPushed(app, event)
            app.Label.Text = 'Botão da direita pressionado';
            value_right = str2num(app.Label_right.Text);
            value_right = value_right + 1;
            app.Label_right.Text = num2str(value_right);
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';

            % Create Button_left
            app.Button_left = uibutton(app.UIFigure, 'push');
            app.Button_left.ButtonPushedFcn = createCallbackFcn(app, @Button_leftPushed, true);
            app.Button_left.FontSize = 18;
            app.Button_left.Position = [73 332 187 43];
            app.Button_left.Text = 'Carrega em mim';

            % Create Button_right
            app.Button_right = uibutton(app.UIFigure, 'push');
            app.Button_right.ButtonPushedFcn = createCallbackFcn(app, @Button_rightPushed, true);
            app.Button_right.FontSize = 18;
            app.Button_right.Position = [382 332 187 43];
            app.Button_right.Text = 'BATE-ME';

            % Create Label
            app.Label = uilabel(app.UIFigure);
            app.Label.HorizontalAlignment = 'center';
            app.Label.FontSize = 18;
            app.Label.Position = [73 230 495 23];
            app.Label.Text = '';

            % Create Label_left
            app.Label_left = uilabel(app.UIFigure);
            app.Label_left.HorizontalAlignment = 'center';
            app.Label_left.FontSize = 18;
            app.Label_left.FontWeight = 'bold';
            app.Label_left.Position = [73 136 186 24];
            app.Label_left.Text = '0';

            % Create Label_right
            app.Label_right = uilabel(app.UIFigure);
            app.Label_right.HorizontalAlignment = 'center';
            app.Label_right.FontSize = 18;
            app.Label_right.FontWeight = 'bold';
            app.Label_right.Position = [382 136 186 24];
            app.Label_right.Text = '0';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = ex3_code

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

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